SELECT
    s.CUSTOMER_ID,
    p.PRODUCT_NAME,
    p.CATEGORY,
    p.PRICE,
    s.QUANTITY,
    s.SALE_DATE,
    (s.QUANTITY * p.PRICE) AS TOTAL_REVENUE
FROM {{ ref('sales_2') }} s
JOIN {{ ref('prod_info') }} p
    ON s.PRODUCT_ID = p.PRODUCT_ID
WHERE s.SALE_DATE >= DATEADD(month, -15, CURRENT_DATE)