WITH CTE AS (
    SELECT 
    TO_TIMESTAMP(started_at) AS STARTED_AT,
    DATE(TO_TIMESTAMP(started_at)) AS DATE_STARTED_AT,
    HOUR(TO_TIMESTAMP(started_at)) AS HOUR_STARTED_AT,
    CASE
    WHEN DAYNAME(TO_TIMESTAMP(started_at)) IN ('Sat','Sun') THEN 'WEEKEND'
    ELSE 'BUSINESSDAY' 
    END AS DAYTYPE,
    CASE
    WHEN MONTH(TO_TIMESTAMP(started_at)) IN (12,1,2) THEN 'WINTER'
    WHEN MONTH(TO_TIMESTAMP(started_at)) IN (3,4,5) THEN 'SPRING'
    WHEN MONTH(TO_TIMESTAMP(started_at)) IN (6,7,8) THEN 'SUMMER'
    ELSE 'AUTUMN'
    END AS SEASON_OF_YEAR

    FROM {{ source('demo', 'bike') }}
)

SELECT * FROM cte 