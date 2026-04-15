{{ config(tags=['business']) }}

SELECT f.*
FROM {{ ref('fct_lineitems') }} f
LEFT JOIN {{ ref('dim_product') }} d
  ON f.product_key = d.product_key
WHERE d.product_key IS NULL