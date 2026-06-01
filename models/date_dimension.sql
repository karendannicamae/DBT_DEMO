WITH CTE AS (
    SELECT 
    TO_TIMESTAMP(started_at) AS STARTED_AT,
    DATE(TO_TIMESTAMP(started_at)) AS DATE_STARTED_AT,
    HOUR(TO_TIMESTAMP(started_at)) AS HOUR_STARTED_AT,
    {{get_daytype('STARTED_AT')}} AS DAYTYPE,
    {{get_season('STARTED_AT')}} AS SEASON_OF_YEAR
    -- FROM {{ source('demo', 'bike') }}
    from {{ ref('stg_bike') }}
)

SELECT * FROM cte 