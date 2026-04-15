{{ config(tags=['staging']) }}

select {{ clean_columns_auto("tpch", "customer") }}
from {{ source("tpch", "customer") }}
