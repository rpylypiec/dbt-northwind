--sources
with source_customers as (
    select * from {{ ref('stg_customers') }}
),
source_orders as (
    select * from {{ ref('stg_orders') }}
),
source_order_details as (
    select * from {{ ref('stg_order_details') }}
),
--regras de negócio
customer_revenue_cte as (
select
    c.customer_id,
    c.company_name,
    c.contact_name,
    c.country,
    sum(od.line_revenue) as total_revenue
from source_customers c
inner join source_orders o
    on c.customer_id = o.customer_id
inner join source_order_details od
    on o.order_id = od.order_id
group by
    c.customer_id,
    c.company_name,
    c.contact_name,
    c.country
)
--querie final
select * from customer_revenue_cte
