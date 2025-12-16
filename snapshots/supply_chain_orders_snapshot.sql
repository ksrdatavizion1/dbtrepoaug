{% snapshot scd2_orders_timestamp %}
    {{
        config(
            target_schema='SILVER_SCHEMA',
            target_database='DBT_LABS_SILVER',
            unique_key='ORDER_ID',
            strategy='timestamp',
            updated_at='UPDATED_AT'
        )
    }}

    select * from {{ source('raw_data', 'supply_chain') }}
 {% endsnapshot %}