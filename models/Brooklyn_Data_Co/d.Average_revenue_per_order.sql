--d.Average_revenue_per_order
with 

--Import CTE
snowflake_orders_payments as (
    select 
    * 
    from {{ source('HELTON', 'order_payments') }}
),

--Final CTE
final as (
    select 
    cast(avg(snowflake_orders_payments.payment_value) AS NUMERIC(18,2)) as Average_Revenue_per_Order_USD
    from snowflake_orders_payments
)

--End 
select * from final;