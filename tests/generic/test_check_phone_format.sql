{% test phone_format(model, column_name) %}
    SELECT *
    FROM {{ model }}
    WHERE {{ column_name }} IS NOT NULL
    AND NOT REGEXP_LIKE({{ column_name }}, '^[0-9]{2}-[0-9]{3}-[0-9]{3}-[0-9]{4}$')
{% endtest %}
