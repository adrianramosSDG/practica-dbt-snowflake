{{ config(tags=['staging']) }}

select {{ clean_columns_auto("tpch", "nation") }}
from {{ source("tpch", "nation") }}
