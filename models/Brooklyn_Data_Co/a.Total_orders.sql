--a.Total_orders
with 

--Import CTE
snowflake_orders as (
    select 
    * 
    from {{ source('HELTON', 'ORDERS') }}
),

--Final CTE
final as (
    select 
    count(snowflake_orders.order_id) as Number_of_Orders --Count the total of orders
    from snowflake_orders
)

--End
select * from final;


