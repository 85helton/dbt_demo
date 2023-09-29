--c.Total revenue
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
    sum(snowflake_orders_payments.payment_value) as Revenue_USD 
    from snowflake_orders_payments
)

--End
select * from final;