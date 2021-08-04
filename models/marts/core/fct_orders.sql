with orders as (
    select * from {{ ref('stg_orders') }}
),

customers as (
    select * from {{ ref('stg_customers') }}
),

payments as (
    select * from {{ ref('stg_payments') }}
)

select
    orders.order_id,
    customers.customer_id,
    payments.dollar_amount as amount
from
    orders 
    left join customers using (customer_id)
    left join payments using (order_id)
    