{% snapshot my_snapshot %}
    {{
        config(
            target_database="DBT_LABS",
            target_schema="SILVER_SCH",
            unique_key="ORDER_ID",
            strategy="timestamp",
            updated_at="updated_at",
            pre_hook="{{ log_snapshot_start('my_snapshot') }}",
            post_hook="{{ log_snapshot_end('my_snapshot', this) }}",
        )
    }}

    select *
    from {{ source("raw_data", "supply_chain") }}

{% endsnapshot %}
