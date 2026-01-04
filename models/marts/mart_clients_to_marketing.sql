--source
with source_mart_customer_revenue_group as (
    select * from {{ ref('mart_customer_revenue_group') }}
),
--regras de negócio
with clients_to_marketing_cte as (
    select
    company_name,
    total_revenue,
    customer_group
from source_mart_customer_revenue_group
where customer_group >= 3
order by total_revenue desc
)
--querie final
select * from clients_to_marketing_cte