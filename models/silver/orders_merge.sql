{{
    config(
        query_tag = 'DBT_query',
        incremental_predicates = ["DBT_INTERNAL_DEST.order_date >= dateadd(day, -2, current_date)"]
    )
}}

select *
from {{ source("raw_data", "ord") }}

{% if is_incremental() %} where order_date >= dateadd(day, -5, current_date) {% endif %}
