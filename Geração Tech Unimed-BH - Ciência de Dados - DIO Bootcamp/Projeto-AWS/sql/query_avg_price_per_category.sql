-- Média do preço dos jogos de cada categoria

SELECT
    TRIM(split_genre) AS genre,
    ROUND(AVG(price_overview), 2) AS avg_price
FROM
    "AwsDataCatalog"."steam-games-db"."steam_game_files"
CROSS JOIN UNNEST(SPLIT(genre, '/')) AS t(split_genre)
GROUP BY
    TRIM(split_genre)
ORDER BY
    avg_price DESC;
