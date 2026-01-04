--sources
with source_int_customer_revenue as (
    select * from {{ ref('int_customer_revenue') }}
),
--regras de negócio
with customer_revenue_group as (
    select
    company_name,
    total_revenue,
    ntile(5) over (order by total_revenue desc) as customer_group
from source_int_customer_revenue
order by total_revenue desc
)
--querie final
select * from customer_revenue_group