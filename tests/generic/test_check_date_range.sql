{% test date_range(model, column_name) %}
    SELECT *
    FROM {{ model }}
    WHERE {{ column_name }} IS NOT NULL
    AND (
        {{ column_name }} < '1950-01-01'
        OR {{ column_name }} > CURRENT_DATE
    )
{% endtest %}