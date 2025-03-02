select
    customer_id,
    customer_group,
from {{ source('raw_data', 'customer') }}