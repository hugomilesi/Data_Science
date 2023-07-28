# Criando a tabela

```
aws dynamodb create-table ^
    --table-name PlayerProgression ^
    --attribute-definitions ^
        AttributeName=PlayerID,AttributeType=S ^
        AttributeName=Level,AttributeType=N ^
    --key-schema ^
        AttributeName=PlayerID,KeyType=HASH ^
        AttributeName=Level,KeyType=RANGE ^
    --provisioned-throughput ^
        ReadCapacityUnits=10,WriteCapacityUnits=5
```

### Inserindo Multiplos Valores na tabela

```
aws dynamodb batch-write-item ^
    --request-items file://src/player_data.json
```

### Criando um GSI para PlayerName

```
aws dynamodb update-table ^
    --table-name PlayerProgression ^
    --attribute-definitions AttributeName=PlayerName,AttributeType=S ^
    --global-secondary-index-updates "[{\"Create\":{\"IndexName\": \"player_name-index\",\"KeySchema\":[{\"AttributeName\":\"PlayerName\",\"KeyType\":\"HASH\"}],\"ProvisionedThroughput\": {\"ReadCapacityUnits\": 10, \"WriteCapacityUnits\": 5},\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"

```

### Criando um GSI para CharacterClass

```
aws dynamodb update-table ^
    --table-name PlayerProgression ^
    --attribute-definitions AttributeName=CharacterClass,AttributeType=S ^
    --global-secondary-index-updates "[{\"Create\":{\"IndexName\": \"char_class-index\",\"KeySchema\":[{\"AttributeName\":\"CharacterClass\",\"KeyType\":\"HASH\"}],\"ProvisionedThroughput\": {\"ReadCapacityUnits\": 10, \"WriteCapacityUnits\": 5},\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"

```
**PROTIP:** Para verificar se o GSI ja foi criado, basta digitar o seguinte comando:

```
aws dynamodb describe-table --table-name PlayerProgression | findstr IndexStatus
```
Se retornar ``` "IndexStatus": "ACTIVE"```, significa que o GSI ja está pronto para uso.

## Query com o Global Secondary Index


Procura os dadosdo jogador de nome "ShockyBalboa"
 ```
 aws dynamodb query ^
    --table-name PlayerProgression ^
    --index-name player_name-index ^
    --key-condition-expression "PlayerName = :name" ^
    --expression-attribute-values  "{\":name\":{\"S\":\"ShockyBalboa\"}}"

 ``` 

 Procura dados do jogador que possui um char de classe Necromancer.
 ```
 aws dynamodb query ^
    --table-name PlayerProgression ^
    --index-name char_class-index ^
    --key-condition-expression "CharacterClass = :name" ^
    --expression-attribute-values  "{\":name\":{\"S\":\"Necromancer\"}}"

 ```

Recupera dados do jogador com id de "player123" e level  = 10
```
aws dynamodb get-item ^
    --table-name PlayerProgression ^
    --key "{\"PlayerID\": {\"S\": \"player123\"}, \"Level\": {\"N\": \"10\"}}"

```

 