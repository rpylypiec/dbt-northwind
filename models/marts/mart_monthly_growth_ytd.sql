with monthly_growth_ytd_cte as (
    select
    order_year,
    order_month,
    monthly_revenue,
    monthly_revenue
        - lag(monthly_revenue) over (
            partition by order_year
            order by order_month
        ) as monthly_difference,
    revenue_ytd,
    (
        monthly_revenue
        - lag(monthly_revenue) over (
            partition by order_year
            order by order_month
        )
    )
    / lag(monthly_revenue) over (
        partition by order_year
        order by order_month
    ) * 100 as monthly_growth_percentage
from {{ ref('int_monthly_revenue_ytd') }}
order by order_year, order_month
)

select * from monthly_growth_ytd_cte