{{
  config(
    materialized='incremental',
    unique_key=['orderkey', 'linenumber'],
    tags=['staging']
  )
}}
select {{ clean_columns_auto("tpch", "lineitem") }}
from {{ source("tpch", "lineitem") }}
