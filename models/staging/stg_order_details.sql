--source
with source_order_details as (
    select * from {{ ref('raw_order_details') }}
)
,
--regras de negócio
with od as(
select
    order_id,
    product_id,
    unit_price,
    quantity,
    discount,
    unit_price * quantity * (1 - discount) as line_revenue
from source_order_details
)
--querie final
select * from od