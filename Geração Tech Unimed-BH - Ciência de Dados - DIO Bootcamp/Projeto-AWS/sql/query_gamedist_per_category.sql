-- Contagem dos jogos por categoria

SELECT
    TRIM(split_genre) AS genre,
    COUNT(*) AS game_count
FROM
    "AwsDataCatalog"."steam-games-db"."steam_game_files"
CROSS JOIN UNNEST(SPLIT(genre, '/')) AS t(split_genre)
GROUP BY
    TRIM(split_genre)
ORDER BY
    game_count DESC;
