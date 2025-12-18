SELECT
    plan_id,
    customer_id,
    activated_on,
    validity_days,
    {{ calculate_expiry('activated_on', 'validity_days') }} AS expiry_date
FROM {{ source('snowflake_dbt_data', 'tele_com') }}