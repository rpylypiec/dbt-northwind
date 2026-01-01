with monthly_revenue_cte as (
    select
    extract(year from o.order_date)  as order_year,
    extract(month from o.order_date) as order_month,
    sum(od.line_revenue)             as monthly_revenue
from {{ ref('stg_orders') }} o
join {{ ref('stg_order_details') }} od
  on o.order_id = od.order_id
group by
    extract(year from o.order_date),
    extract(month from o.order_date)
)

select * from monthly_revenue_cte