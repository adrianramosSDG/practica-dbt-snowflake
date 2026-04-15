{{ config(
    materialized='table',
    tags=['marts', 'dimension']
) }}

select
    s.suppkey        as supplier_key,
    s.address        as supplier_address,
    s.phone          as supplier_phone,
    s.acctbal        as supplier_acctbal,
    s.nationkey      as nation_key,
    n.regionkey      as region_key
from {{ ref('stg_supplier') }} s
left join {{ ref('stg_nation') }} n
    on s.nationkey = n.nationkey