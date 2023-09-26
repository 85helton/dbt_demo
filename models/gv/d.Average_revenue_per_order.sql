--d.Average_revenue_per_order
select 
avg(order_payments.payment_value) as Average_revenue_per_order

from HELTON.demo.order_payments;