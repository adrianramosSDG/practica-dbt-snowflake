{{ config(tags=['staging']) }}

select {{ clean_columns_auto("tpch", "part") }}
from {{ source("tpch", "part") }}
