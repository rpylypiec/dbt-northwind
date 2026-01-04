--sources
with source_orders as (
  select * from {{ ref('stg_orders') }}
),
with source_order_details as (
  select * from {{ ref('stg_order_details') }}
),
--regras de negócio
with order_revenues as (
select
    o.order_year,
    sum(od.line_revenue) as total_revenue
from source_orders o
inner join source_order_details od
    on o.order_id = od.order_id
group by o.order_year
)
--querie final
select * from order_revenues