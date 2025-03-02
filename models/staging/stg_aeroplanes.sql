select
    airplane_id,
    airplane_model,
    manufacturer,
from {{ source('raw_data', 'aeroplane') }}