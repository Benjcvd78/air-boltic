with json_data as (
-- Code to flatten and parse the json data
)

select
    id --generated surrogate key from manufacturer and model,
    manufacturer,
    model,
    max_seats,
    max_weight,
    max_distance,
    engine_type,
    case 
        when max_distance < 1500 then 'Short-haul'
        when max_distance < 4000 then 'Medium-haul'
        else 'Long-haul'
    end as distance_category,
    case
        when max_seats < 50 then 'Small'
        when max_seats < 150 then 'Medium'
        else 'Large'
    end as size_category
from json_data