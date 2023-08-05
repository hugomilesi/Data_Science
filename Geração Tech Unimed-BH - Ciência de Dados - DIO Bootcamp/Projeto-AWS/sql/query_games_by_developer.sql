
--Número de jogos por desenvolvedora.
SELECT developer, COUNT(*) AS game_count
FROM "AwsDataCatalog"."steam-games-db"."steam_game_files"
GROUP BY developer
ORDER BY game_count DESC;
