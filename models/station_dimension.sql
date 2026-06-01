WITH bike as (
    select distinct
    start_statio_id as start_station_id,
    start_station_name,
    start_lat,
    start_lng
    -- from {{ source('demo', 'bike') }}
    from {{ ref('stg_bike') }}
)

select * from bike