--source
with source_products as (
    select * from {{ ref('raw_products') }}
)
,
--regra de negócio
with stg_products_cte as (
select
    product_id,
    product_name
from source_products
)
--querie final
select * from stg_products_cte