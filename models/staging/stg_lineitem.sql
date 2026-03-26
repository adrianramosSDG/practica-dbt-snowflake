select {{ clean_columns_auto("tpch", "lineitem") }}
from {{ source("tpch", "lineitem") }}
