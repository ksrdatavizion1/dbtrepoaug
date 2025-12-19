SELECT
    order_id,
    customer_id,
    order_date,
    total_amount
FROM {{ source('snowflake_dbt_data', 'Sale_data') }}
WHERE EXTRACT(YEAR FROM order_date) IN (
    {% set years = var('reporting_year') if var('reporting_year') is iterable else [var('reporting_year')] %}
    {{ years | join(', ') }}
)
AND EXTRACT(MONTH FROM order_date) IN (
    {% set months = var('reporting_month') if var('reporting_month') is iterable else [var('reporting_month')] %}
    {{ months | join(', ') }}
)
