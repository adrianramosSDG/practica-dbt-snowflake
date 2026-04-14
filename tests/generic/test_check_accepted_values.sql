{% test date_range(model, column_name, accepted_values) %}
    SELECT *
    FROM {{ model }}
    WHERE {{ column_name }} IS NOT NULL
      AND {{ column_name }} NOT IN (
        {% for value in accepted_values %}
            '{{ value }}'{% if not loop.last %}, {% endif %}
        {% endfor %}
      )
{% endtest %}