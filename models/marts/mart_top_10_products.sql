--sources
with source_products as (
    select * from {{ ref('stg_products') }}
),
with source_order_details as (
    select * from {{ ref('stg_order_details') }}
),
--regras de negócio
with top_10_products_cte as (
    select
    p.product_name,
    sum(od.line_revenue) as total_sales
from source_products p
inner join source_order_details od
    on p.product_id = od.product_id
group by p.product_name
order by total_sales desc
limit 10
)
--querie final
select * from top_10_products_cte