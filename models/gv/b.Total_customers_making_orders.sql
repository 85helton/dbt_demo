--b.Total_customers_making_orders
with snowflake_orders as (
    select 
    * 
    from {{ source('HELTON', 'ORDERS') }}
),

final as (
    select
    snowflake_orders.customer_id, 
    count(snowflake_orders.order_id) as Number_of_Orders_per_Customer

    from snowflake_orders

    group by snowflake_orders.customer_id
)

select 
* 
from final
;