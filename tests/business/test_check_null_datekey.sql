SELECT *
FROM {{ ref('fct_lineitems') }}
WHERE date_key IS NULL