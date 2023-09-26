--e.Top_3_product_categories_by_revenue_(by_day)
select 
order_items.product_id,
order_items.price,
products.product_category_name

from HELTON.demo.order_items

inner join products on 
products.product_id = order_items.product_id
;
--select * from products