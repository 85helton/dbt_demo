--d.Average_revenue_per_order
select 
cast(
    avg(order_payments.payment_value)
    AS NUMERIC(18,2)) as Average_revenue_per_order

from HELTON.demo.order_payments;