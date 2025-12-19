


SELECT
    *,
    {{ dbt_utils.generate_surrogate_key(['customer_id', 'plan_id']) }} AS customer_plan_sk
FROM {{source('snowflake_dbt_data', 'tele_com')  }}