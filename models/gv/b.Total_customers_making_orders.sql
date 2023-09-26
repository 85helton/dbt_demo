select 
customer_id, 
count(order_id) as total_orders

from HELTON.demo.orders

group by customer_id;