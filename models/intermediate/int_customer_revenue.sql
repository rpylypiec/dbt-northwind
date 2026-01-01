with customer_revenue_cte as (
select
    c.customer_id,
    c.company_name,
    sum(od.line_revenue) as total_revenue
from {{ ref('stg_customers') }} c
inner join {{ ref('stg_orders') }} o
    on c.customer_id = o.customer_id
inner join {{ ref('stg_order_details') }} od
    on o.order_id = od.order_id
group by
    c.customer_id,
    c.company_name
)

select * from customer_revenue_cte
