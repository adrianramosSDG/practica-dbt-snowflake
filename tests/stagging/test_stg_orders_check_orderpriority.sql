SELECT *
FROM {{ ref('stg_orders') }}
WHERE orderpriority IS NOT NULL
  AND (
    orderpriority < 1
    OR orderpriority > 5
  )