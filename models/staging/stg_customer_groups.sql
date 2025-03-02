select
    id,
    type,
    name,
    registry_number
from {{ source('raw_data', 'customer_group') }}