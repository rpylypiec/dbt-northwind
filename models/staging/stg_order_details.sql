with od as(
select
    order_id,
    unit_price,
    quantity,
    discount,
    unit_price * quantity * (1 - discount) as line_revenue
from {{ ref('raw_order_details') }}
)
select * from od