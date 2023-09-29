--f.Percent of day’s revenue associated with each of the top 3 product categories
with 

--Import CTE
payments as (
    select * from {{ source('HELTON', 'order_payments') }}
),

items as (
    select * from {{ source('HELTON', 'order_items') }} 
),

products as (
    select * from {{ source('HELTON', 'products') }}
),

orders as (
    select * from {{ source('HELTON', 'ORDERS') }}
),

--Logicac CTE
top3_categories as (

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
),

last_date_top3_categories as (

select 
cast(max(orders.order_purchase_timestamp) as date) as last_date

from orders

inner join payments on 
orders.order_id = payments.order_id

inner join items on
payments.order_id = items.order_id

inner join products on
items.product_id = products.product_id

where product_category_name in (select product_category_name from top3_categories)
),

last_day_total as (
select 
sum(items.price) as Total

from orders

inner join payments on 
orders.order_id = payments.order_id

inner join items on
payments.order_id = items.order_id

inner join products on
items.product_id = products.product_id

where 
products.product_category_name in (select product_category_name from top3_categories)
and orders.order_purchase_timestamp >= (select last_date from last_date_top3_categories)
),

--Final CTE
final as (
select 
cast(orders.order_purchase_timestamp as date) as Last_Revenue_Date,
products.product_category_name,
sum(items.price) as Total,
(select Total from last_day_total) as Day_total,
concat( cast( cast(round( ((Total*100)/Day_total) ,2) as numeric(36,2)) as varchar(9)) ,'%') as Percentage_of_the_day 

from orders

inner join payments on 
orders.order_id = payments.order_id

inner join items on
payments.order_id = items.order_id

inner join products on
items.product_id = products.product_id

where 
products.product_category_name in (select product_category_name from top3_categories)
and orders.order_purchase_timestamp >= (select last_date from last_date_top3_categories)

group by 
Last_Revenue_Date,
products.product_category_name

)

--End
select * from final