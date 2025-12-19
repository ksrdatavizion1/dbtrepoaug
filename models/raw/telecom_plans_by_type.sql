{# Get distinct plan types from TELE_PLANS source #}
{%- set plan_types = dbt_utils.get_column_values(
    table=source('snowflake_dbt_data', 'tele_com'),
    column='plan_type'
) -%}


{# Loop through each plan_type and generate a SQL block with UNION ALL #}
{%- for type in plan_types %}
    -- Generating block for plan_type: {{ type }}

    SELECT
        customer_id,
        plan_id,
        plan_type,
        price
    FROM {{ source('snowflake_dbt_data', 'tele_com')}}
    WHERE plan_type = '{{ type }}'

    {% if not loop.last %}
        UNION 
    {% endif %}
{% endfor %}
