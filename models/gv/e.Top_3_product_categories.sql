--e.Top_3_product_categories_by_revenue_(by_day)

select 
top 3
products.product_category_name,
sum(order_items.price) as order_total

from HELTON.demo.order_payments as payments

inner join HELTON.demo.order_items as order_items on
payments.order_id = order_items.order_id

inner join HELTON.demo.products as products on
order_items.product_id = products.product_id


group by 
products.product_category_name

ORDER BY order_total desc
;
