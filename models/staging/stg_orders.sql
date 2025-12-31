with renamed as(
select
    order_id,
    order_date,
    extract(year from order_date) as order_year
from {{ ref('raw_orders') }}
)

select * from renamed
