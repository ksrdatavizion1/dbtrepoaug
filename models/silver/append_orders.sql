
select * from {{ source('raw_data', 'ord') }}

{% if is_incremental() %}
    Where order_id > (select max(order_id) from {{this}} )
{% endif %}