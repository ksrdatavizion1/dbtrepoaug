{%- set username = "admin_user" -%}
{%- set environment = "production" -%}

select '{{ var("name") }}' as global_var,
       '{{ username }}' as user_name
