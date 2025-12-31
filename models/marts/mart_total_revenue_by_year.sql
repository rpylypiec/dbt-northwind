with total_revenue_by_year as (
select
    order_year,
    total_revenue
from {{ ref('int_order_revenues') }}
where order_year = 1997
)

select * from total_revenue_by_year