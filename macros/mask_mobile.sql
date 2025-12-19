{% macro mask_moblie(col) %}
    CONCAT('XXXXXXX', RIGHT({{col}},3))
{% endmacro %}