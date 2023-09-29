--a.Total_orders
with snowflake_orders as (
    select 
    * 
    from {{ source('HELTON', 'ORDERS') }}
),

final as (
    select 
    count(snowflake_orders.order_id) as Number_of_Orders 
    from snowflake_orders
)

select 
*

from final;


