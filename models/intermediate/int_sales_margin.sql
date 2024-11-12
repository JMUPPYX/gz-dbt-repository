with
source as (
SELECT*
--purchase_cost= quantity*purchase_price
,raw_sales.quantity*raw_product.purchase_price AS purchase_cost
FROM
{{ ref('stg_raw__product') }} AS raw_product
LEFT JOIN
{{ ref('stg_raw__sales') }} AS raw_sales
USING (products_id)
)
SELECT *
--margin= revenue-purchase_cost
,new_source.revenue - new_source.purchase_cost AS margin
FROM
source as new_source