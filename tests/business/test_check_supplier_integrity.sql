{{ config(tags=['business']) }}

SELECT f.*
FROM {{ ref('fct_lineitems') }} f
LEFT JOIN {{ ref('dim_supplier') }} d
  ON f.supplier_key = d.supplier_key
WHERE d.supplier_key IS NULL