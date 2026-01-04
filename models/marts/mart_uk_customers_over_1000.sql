--sources
with sources_int_customer_revenue as (
  select * from {{ ref('int_customer_revenue') }}
),
--regras de negócio
with uk_customers_over_1000_cte as (
    select
    contact_name,
    round(total_revenue::numeric, 2) as payments
from sources_int_customer_revenue
where country = 'uk'
  and total_revenue > 1000
order by payments desc
)
--querie final
select * from uk_customers_over_1000_cte