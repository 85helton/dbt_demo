--a.Total_orders
select 
count(HELTON.demo.orders.order_id) as total_orders

from HELTON.demo.orders;