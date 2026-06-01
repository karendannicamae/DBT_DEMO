WITH trips as (
    select 
    ride_id,
    -- rideable_type,
    date(to_timestamp(started_at)) as trip_date,
    start_statio_id AS start_station_id,
    end_station_id,
    member_csual as member_casual,
    timestampdiff(second,to_timestamp(started_at),to_timestamp(ended_at)) as trip_duration_seconds
   -- from {{ source('demo', 'bike') }}
   from {{ ref('stg_bike') }}
    where started_at != 'started_at'
)

select * from trips