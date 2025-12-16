
{% snapshot supply_chain_orders_snapshot %}
{{
    config(
        database="DBT_LABS",
        target_schema="SILVER_SCH",
        unique_key="ORDER_ID",
        strategy="timestamp",
        updated_at="UPDATED_AT",
        query_tag="dbt",
        snapshot_meta_column_names={
            "dbt_valid_from": "start_date",
            "dbt_valid_to": "end_date",
            "dbt_scd_id": "scd_id",
            "dbt_updated_at": "modified_date",
            "dbt_is_deleted": "is_deleted"
        }
    )
}}

select
    order_id,
    supplier_id,
    supplier_name,
    product_id,
    product_name,
    warehouse_id,
    warehouse_region,
    order_date,
    delivery_date,
    quantity,
    unit_cost,
    total_cost,
    status,
    updated_at
from {{ source("raw_data", "supply_chain") }}

{% endsnapshot %}