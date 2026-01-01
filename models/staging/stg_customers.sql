with customers_cte as (
    select
    customer_id,
    company_name
from {{ ref('raw_customers') }}
)

select * from customers_cte