{{
    config(
        materialized='incremental',
        unique_key = "order_id",
        incremental_strategy = 'delete+insert',
        on_schema_change = 'sync_all_columns'
    )
}}

Select * from {{ source('raw_data', 'ord') }}  
 
{% if is_incremental() %}
    Where order_date >= DATEADD(day, -2, current_date)
{% endif %}