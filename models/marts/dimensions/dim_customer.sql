{{ config(
    materialized='table',
    tags=['marts', 'dimension']
) }}

select
    c.custkey        as customer_key,
    c.address        as customer_address,
    c.phone          as customer_phone,
    c.acctbal        as customer_acctbal,
    c.mktsegment     as market_segment,
    c.nationkey      as nation_key,
    n.regionkey      as region_key
from {{ ref('stg_customers') }} c
left join {{ ref('stg_nation') }} n
    on c.nationkey = n.nationkey