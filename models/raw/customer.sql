
SELECT
    CUSTOMER_ID as CUSTID, FIRST_NAME,LAST_NAME, concat_ws(' ',FIRST_NAME,LAST_NAME ) as FULL_NAME, 
    EMAIL,PHONE AS PHN_NUMBER,CITY,STATE
FROM {{ source('raw_data', 'cust') }}   -- jinja