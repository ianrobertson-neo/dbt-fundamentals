with payments as (

    select
        id as payment_id,
        orderid as payment_order_id,
        paymentmethod,
        status,
        amount
    from raw.stripe.payment

)

select * from payments