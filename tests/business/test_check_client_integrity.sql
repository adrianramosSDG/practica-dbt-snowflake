SELECT f.*
FROM {{ ref('fct_lineitems') }} f
LEFT JOIN {{ ref('dim_customer') }} d
  ON f.customer_key = d.customer_key
WHERE d.customer_key IS NULL