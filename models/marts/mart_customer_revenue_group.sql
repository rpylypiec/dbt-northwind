with customer_revenue_group as (
    select
    company_name,
    total_revenue,
    ntile(5) over (order by total_revenue desc) as customer_group
from {{ ref('int_customer_revenue') }}
order by total_revenue desc
)

select * from customer_revenue_group