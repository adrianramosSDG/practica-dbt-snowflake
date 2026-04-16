{{ config(tags=['staging']) }}

select {{ clean_columns_auto("tpch", "supplier") }}
from {{ source("tpch", "supplier") }}
