{% test valid_email_format(model, column_name) %}

SELECT *
FROM {{ model }}
where 
        {{ column_name }} not like '%@%'
        
     or {{ column_name }} not like '%.%'

{% endtest %}