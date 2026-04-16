{{ config(tags=['stagging']) }}

SELECT *
FROM {{ ref('stg_tpch__orders') }}
WHERE orderpriority IS NOT NULL
  AND (
    orderpriority < 1
    OR orderpriority > 5
  )