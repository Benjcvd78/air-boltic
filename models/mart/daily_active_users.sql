with orders_enhanced as (
    select * from {{ ref('int_orders_enhanced') }}
),

-- Generate a continuous date array for daily metrics
date_array as (
    select date_day as date
    from unnest(generate_date_array(
        (select min(trip_date) from orders_enhanced),
        (select max(trip_date) from orders_enhanced),
        interval 1 day
    )) as date_day
)

select
    days.date,
    count(distinct orders.customer_id) as daily_active_users,
    sum(coalesce(orders.price, 0)) as daily_revenue
from date_array as days
left join orders_enhanced orders
    on days.date = date_trunc(orders.trip_date, day) and orders.status = 'Finished'
group by 1
order by 1 