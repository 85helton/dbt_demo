--c.Total revenue
select 
sum(order_payments.payment_value) as Total_revenue

from HELTON.demo.order_payments

;