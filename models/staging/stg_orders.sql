select
    order_id,
    customer_id,
    trip_id,
    price,
    seat_no,
    status
from {{ source('raw_data', 'order') }}