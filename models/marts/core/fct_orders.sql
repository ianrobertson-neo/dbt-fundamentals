/*

with orders as (
    select * from {{ ref('stg_orders') }}
),

payments as (
    select * from {{ ref('stg_payments') }}
),

final as (

    select 
        orders.order_id,
        orders.customer_id,
        payments.amount
    from orders
    inner join payments using (order_id) 

)

select * from final

*/

/*
--COPY FROM TUTORIAL

with orders as  (
    select * from {{ ref('stg_orders') }}
),

payments as (
    select * from {{ ref('stg_payments') }}
),

order_payments as (
    select
        orderid,
        sum(case when status = 'success' then amount end) as amount

    from payments
    group by 1
),

final as (

    select
        orders.orderid,
        orders.customer_id,
        orders.order_date,
        coalesce(order_payments.amount, 0) as amount

    from orders
    left join order_payments using (orderid)
)

select * from final
*/

with payments as (
    select * from {{ ref('stg_payments') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

final as (
    select *
    from orders
    --inner join payments using (orderid) 
)

select * from final