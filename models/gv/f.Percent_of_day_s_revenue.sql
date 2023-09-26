--f.Percent of day’s revenue associated with each of the top 3 product categories

select 
top 3
products.product_category_name,
payments.
sum(order_items.price) as order_total

from HELTON.demo.order_payments as payments

inner join HELTON.demo.order_items as order_items on
payments.order_id = order_items.order_id

inner join HELTON.demo.products as products on
order_items.product_id = products.product_id

inner join HELTON.demo.orders as orders on
order.order_id = payments.order_id


group by 
products.product_category_name

ORDER BY order_total desc
;
--select * from HELTON.demo.orders