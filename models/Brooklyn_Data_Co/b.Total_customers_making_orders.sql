--b.Total_customers_making_orders
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
    snowflake_orders.customer_id, 
    count(snowflake_orders.order_id) as Number_of_Orders_per_Customer
    --Count the total orders gouped by customer
    from snowflake_orders

    group by snowflake_orders.customer_id
)

--End
select * from final;