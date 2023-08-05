-- Media de recomendações por produtora
SELECT publisher, ROUND(AVG(recommendations), 2) AS avg_recommendations
FROM "AwsDataCatalog"."steam-games-db"."steam_game_files"
GROUP BY publisher
ORDER BY avg_recommendations DESC;
