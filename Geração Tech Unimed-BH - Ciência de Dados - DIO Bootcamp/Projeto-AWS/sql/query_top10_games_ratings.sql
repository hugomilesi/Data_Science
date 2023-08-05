-- Jogos aclamados pela crítica
SELECT
    name,
    metacritic_score
FROM
    "AwsDataCatalog"."steam-games-db"."steam_game_files"
ORDER BY
    metacritic_score DESC
LIMIT
    10;
