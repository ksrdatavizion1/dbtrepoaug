SELECT
    customer_id,
    full_name,
    state,
    city,
    {{ mask_moblie('mobile_number') }} AS masked_mobile,
    email,
    gender,
    age,
    registered_on
FROM {{ source('snowflake_dbt_data', 'TELECOM_CUSTOMERS_FRESHNESS') }}