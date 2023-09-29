--c.Total revenue
with snowflake_orders_payments as (
    select 
    * 
    from {{ source('HELTON', 'order_payments') }}
),

final as (
    select 
    sum(snowflake_orders_payments.payment_value) as Revenue_USD 
    from snowflake_orders_payments
)

select 
*
from final;