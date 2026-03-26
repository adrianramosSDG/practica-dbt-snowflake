select {{ clean_columns_auto("tpch", "orders") }}
from {{ source("tpch", "orders") }}
