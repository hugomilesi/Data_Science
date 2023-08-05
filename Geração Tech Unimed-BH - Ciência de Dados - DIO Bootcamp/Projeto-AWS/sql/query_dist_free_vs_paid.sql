-- Distribuição dos jogos gratuitos vs pagos
SELECT
    is_free as jogo_gratis,
    COUNT(*) AS game_count,
    ROUND((COUNT(*) * 100.0 / SUM(COUNT(*)) OVER()), 2) AS porcentagem
FROM "AwsDataCatalog"."steam-games-db"."steam_game_files"
GROUP BY is_free;
