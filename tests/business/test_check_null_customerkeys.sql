SELECT *
FROM {{ ref('fct_lineitems') }}
WHERE customer_key IS NULL