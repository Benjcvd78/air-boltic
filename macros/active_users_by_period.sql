{% macro active_users_by_period(period) %}

with orders_enhanced as (
    select * from {{ ref('int_orders_enhanced') }}
),

-- Generate a continuous date array for {{ period }} metrics
date_array as (
    select date_day as date
    from unnest(generate_date_array(
        (select min(trip_date) from orders_enhanced),
        (select max(trip_date) from orders_enhanced),
        interval 1 {{ period }}
    )) as date_day
)

select
    date_trunc(days.date, {{ period }}) as period_date,
    count(distinct orders.customer_id) as {{ period }}ly_active_users,
    sum(coalesce(orders.price, 0)) as {{ period }}ly_revenue
from date_array as days
left join orders_enhanced orders
    on date_trunc(days.date, {{ period }}) = date_trunc(orders.trip_date, {{ period }}) 
    and orders.status = 'Finished'
group by 1
order by 1

{% endmacro %} 