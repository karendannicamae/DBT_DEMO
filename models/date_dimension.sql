WITH CTE AS (
    SELECT 
    TO_TIMESTAMP(started_at) AS STARTED_AT,
    DATE(TO_TIMESTAMP(started_at)) AS DATE_STARTED_AT,
    HOUR(TO_TIMESTAMP(started_at)) AS HOUR_STARTED_AT,
    CASE
    WHEN DAYNAME(TO_TIMESTAMP(started_at)) IN ('Sat','Sun') THEN 'WEEKEND'
    ELSE 'BUSINESSDAY' 
    END AS DAYTYPE,
    {{get_season('STARTED_AT')}} AS SEASON_0F_YEAR 

    FROM {{ source('demo', 'bike') }}
)

SELECT * FROM cte 