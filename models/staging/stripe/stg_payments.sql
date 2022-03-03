with payments as (

    select
        id as payment_id,
        orderid as order_id,
        paymentmethod,
        status,
        amount
    from {{ source('stripe','payment') }}
    --from raw.stripe.payments

)

select * from payments