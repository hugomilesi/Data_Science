-- Quantidade de jogos de cada publisher
SELECT
    publisher, COUNT(*) AS num_games
FROM "AwsDataCatalog"."steam-games-db"."steam_game_files"
GROUP BY publisher
ORDER BY num_games DESC
LIMIT 10;
