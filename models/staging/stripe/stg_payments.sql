select
    id,
    orderid as order_id,
    paymentmethod as payment_method,
    status as order_status,
    amount/100 as dollar_amount,
    created as created,
    date_trunc('second', _batched_at) as batched_at
from
    raw.stripe.payment


