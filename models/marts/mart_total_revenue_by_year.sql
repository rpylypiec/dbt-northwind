--sources
with source_int_order_revenues as (
    select * from {{ ref('int_order_revenues') }}
),
--regras de negócio
with total_revenue_by_year as (
select
    order_year,
    total_revenue
from source_int_order_revenues
where order_year = 1997
)
--querie final
select * from total_revenue_by_year