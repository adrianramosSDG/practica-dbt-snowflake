{{
  config(
    materialized='incremental',
    unique_key=['orderkey', 'linenumber']
  )
}}
select {{ clean_columns_auto("tpch", "lineitem") }}
from {{ source("tpch", "lineitem") }}
