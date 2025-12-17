select * from {{ source("snowflake_dbt_data", "TELECOM_CUSTOMERS_FRESHNESS") }}
