--source
with source_orders as(
    select * from {{ ref('raw_orders') }}
)
,
--regras de negócio
renamed as(
select
    order_id,
    customer_id,
    order_date,
    extract(year from order_date) as order_year
from source_orders
)
--querie final
select * from renamed
