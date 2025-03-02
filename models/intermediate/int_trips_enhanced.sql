with trips as (
    select * from {{ ref('stg_trips') }}
),

aircraft_details as (
    select * from {{ ref('int_aircraft_details') }}
)

select
    trips.trip_id,
    trips.origin_city,
    trips.destination_city,
    trips.airplane_id,
    trips.start_timestamp,
    trips.end_timestamp,
    datediff('minute', trips.start_timestamp, trips.end_timestamp) as trip_duration_minutes,
    aircraft_details.max_seats,
    aircraft_details.distance_category,
    aircraft_details.size_category,
    aircraft_details.engine_type
from trips
left join aircraft_details on trips.airplane_id = aircraft_details.airplane_id 