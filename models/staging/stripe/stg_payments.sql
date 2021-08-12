with payments as (select
    id,
    orderid as order_id,
    paymentmethod as payment_method,
    status as order_status,
    {{ cents_to_dollars('amount', 2) }} as amount,
    created as created,
    date_trunc('second', _batched_at) as batched_at
from
    {{ source('stripe', 'payment')}}
    )

select * from payments


