{% macro filter_telecom_data(customers_table, plans_table) %}
    SELECT 
        c.customer_id,
        c.full_name,
        c.state,
        p.plan_name,
        p.plan_type,
        p.price
    FROM {{ var("database_name") }}.{{ var("schema_name") }}.{{ customers_table }} c
    JOIN {{ var("database_name") }}.{{ var("schema_name") }}.{{ plans_table }} p
        ON c.customer_id = p.customer_id
    WHERE c.state = '{{ var("customer_state") }}'
      AND p.plan_type = '{{ var("plan_type") }}'
{% endmacro %}