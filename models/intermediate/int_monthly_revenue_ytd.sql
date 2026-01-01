with monthly_revenue_ytd_cte as(
    select
    order_year,
    order_month,
    monthly_revenue,
    sum(monthly_revenue) over (
        partition by order_year
        order by order_month
        rows between unbounded preceding and current row
    ) as revenue_ytd
from {{ ref('int_monthly_revenue') }}
)
select * from monthly_revenue_ytd_cte