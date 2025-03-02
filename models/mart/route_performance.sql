with orders_enhanced as (
    select * from {{ ref('int_orders_enhanced') }}
)

select
    origin_city,
    destination_city,
    count(order_id) as total_orders,
    sum(price) as total_order_value,
    case when status = 'Finished' then sum(price) else 0 end as total_revenue,
    case when status = 'Finished' then coalsece(sum(price) / count(distinct order_id),0) else 0 end as avg_revenue_per_trip
from orders_enhanced
group by 1, 2, 3, 4
order by 4, 5 desc 