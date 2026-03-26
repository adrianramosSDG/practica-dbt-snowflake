{% macro clean_columns_auto(source_name, table_name) %}

    {% set relation = source(source_name, table_name) %}
    {% set columns = adapter.get_columns_in_relation(relation) %}
    {% set ns = namespace(first=true) %}

    {% for col in columns %}
        {% set col_name = col.name %}
        {% set new_name = col.name.split("_", 1)[1] if "_" in col.name else col.name %}
        {% set col_type = col.data_type | upper %}

        {% if new_name == "NAME" %}
            {{ log("Columna omitida en tabla " ~ table_name ~ ": " ~ new_name, info=True) }}
        {% else %}
            {{ log("Columna NO omitida en tabla " ~ table_name ~ ": " ~ new_name, info=True) }}

            {% if not ns.first %}, {% endif %}
            {% set ns.first = false %}

            {% if "CHAR" in col_type or "TEXT" in col_type or "STRING" in col_type or "VARCHAR" in col_type %}
                case
                    when {{ col_name }} like '%#%'
                    then to_varchar(to_number(regexp_substr({{ col_name }}, '[0-9]+$')))
                    else {{ col_name }}
                end as {{ new_name }}
            {% else %}
                {{ col_name }} as {{ new_name }}
            {% endif %}
        {% endif %}
    {% endfor %}

{% endmacro %}