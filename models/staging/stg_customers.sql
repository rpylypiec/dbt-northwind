--source
with source_customers as (
    select * from {{ ref('raw_customers') }}
)
,
--regras de negócio
customers_cte as (
    select
    customer_id,
    company_name,
    contact_name,
    lower(country) as country
from source_customers
)
--querie final
select * from customers_cte