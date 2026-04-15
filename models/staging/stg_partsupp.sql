{{ config(tags=['staging']) }}

select {{ clean_columns_auto("tpch", "partsupp") }}
from {{ source("tpch", "partsupp") }}
