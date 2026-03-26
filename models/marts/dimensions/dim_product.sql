{{ config(materialized='table') }}

select
    p.partkey        as product_key,
    p.mfgr           as manufacturer,
    p.brand          as brand,
    p.type           as product_type,
    p.size           as product_size,
    p.container      as container,
    p.retailprice    as retail_price
from {{ ref('stg_part') }} p