with orders as (
    select * from {{ ref('stg_orders') }}
),

trips as (
    select * from {{ ref('int_trips_enhanced') }}
),

customers as (
    select * from {{ ref('int_customer_profile') }}
)

select
    orders.order_id,
    orders.customer_id,
    orders.trip_id,
    orders.price,
    orders.seat_no,
    orders.status,
    customers.customer_group_type,
    customers.customer_group_name,
    trips.origin_city,
    trips.destination_city,
    trips.start_timestamp,
    trips.end_timestamp,
    trips.trip_duration_hours,
from orders
left join trips on orders.trip_id = trips.trip_id
left join customers on orders.customer_id = customers.customer_id 