with order_revenues as (
select
    o.order_year,
    sum(od.line_revenue) as total_revenue
from {{ ref('stg_orders') }} o
inner join {{ ref('stg_order_details') }} od
    on o.order_id = od.order_id
group by o.order_year
)
select * from order_revenues