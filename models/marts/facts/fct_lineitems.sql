{{ config(
    materialized='table',
    tags=['marts', 'fact']
    ) 
}}

with lineitems as (

    select
        orderkey,
        partkey,
        suppkey,
        linenumber,
        quantity,
        extendedprice,
        discount,
        tax,
        returnflag,
        linestatus,
        shipdate,
        commitdate,
        receiptdate,
        shipinstruct,
        shipmode
    from {{ ref('stg_tpch__lineitem') }}

),

orders as (

    select
        orderkey,
        custkey,
        orderdate
    from {{ ref('stg_tpch__orders') }}

),

final as (

    select
        l.orderkey                              as order_key,
        l.linenumber                            as line_number,
        o.custkey                               as customer_key,
        l.partkey                               as product_key,
        l.suppkey                               as supplier_key,
        o.orderdate                             as date_key,

        l.quantity                              as quantity,
        l.extendedprice                         as extended_price,
        l.discount                              as discount,
        l.tax                                   as tax,

        l.extendedprice * (1 - l.discount)      as net_amount,
        l.extendedprice * (1 - l.discount) * (1 + l.tax) as gross_amount,

        1                                       as line_count,

        l.returnflag                            as return_flag,
        l.linestatus                            as line_status,
        l.shipdate                              as ship_date,
        l.commitdate                            as commit_date,
        l.receiptdate                           as receipt_date,
        l.shipinstruct                          as ship_instruct,
        l.shipmode                              as ship_mode

    from lineitems l
    left join orders o
        on l.orderkey = o.orderkey
)

select *
from final