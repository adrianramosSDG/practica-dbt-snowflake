{{ config(
    materialized='table',
    tags=['marts', 'dimension']
) }}

with distinct_dates as (

    select distinct
        orderdate
    from {{ ref('stg_tpch__orders') }}
    where orderdate is not null

)

select
    orderdate                                            as date_key,
    orderdate                                            as full_date,
    extract(year from orderdate)                         as year,
    extract(quarter from orderdate)                      as quarter,
    extract(month from orderdate)                        as month,
    extract(day from orderdate)                          as day_of_month,
    to_char(orderdate, 'MON')                            as month_name_short,
    to_char(orderdate, 'MMMM')                           as month_name
from distinct_dates