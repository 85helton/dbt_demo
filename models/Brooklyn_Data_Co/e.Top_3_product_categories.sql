--e.Top_3_product_categories_by_revenue_(by_day)
with 

payments as (
    select * from {{ source('HELTON', 'order_payments') }}
),

items as (
    select * from {{ source('HELTON', 'order_items') }} 
),

products as (
    select * from {{ source('HELTON', 'products') }}
),


final as (
select 
top 3
products.product_category_name,
sum(items.price) as order_total

from payments

inner join items on
payments.order_id = items.order_id

inner join products on
items.product_id = products.product_id

group by 
products.product_category_name

ORDER BY order_total desc
)

select * from final
