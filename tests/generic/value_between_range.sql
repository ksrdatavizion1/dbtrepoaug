
{% test value_between_range(model, column_name, min_value, max_value) %}

SELECT *
FROM {{ model }}
WHERE {{ column_name }} < {{ min_value }}
   OR {{ column_name }} > {{ max_value }}
   OR {{ column_name }} IS NULL  -- only if you want nulls to fail here

{% endtest %}