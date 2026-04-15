{{ config(tags=['staging']) }}

select {{ clean_columns_auto("tpch", "region") }}
from {{ source("tpch", "region") }}
