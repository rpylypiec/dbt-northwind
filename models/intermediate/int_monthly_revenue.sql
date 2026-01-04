--sources
with source_orders as (
  select * from {{ ref('stg_orders') }}
),
source_order_details as (
  select * from {{ ref('stg_order_details') }}
),
--regras de negócio
monthly_revenue_cte as (
    select
    extract(year from o.order_date)  as order_year,
    extract(month from o.order_date) as order_month,
    sum(od.line_revenue)             as monthly_revenue
from source_orders o
join source_order_details od
  on o.order_id = od.order_id
group by
    extract(year from o.order_date),
    extract(month from o.order_date)
)
--querie final
select * from monthly_revenue_cte