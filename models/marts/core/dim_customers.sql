with customers as (

    select
        *
    from
        {{ ref('stg_customers') }}

),

orders as (

    select
        *
    from 
        {{ ref('stg_orders')}}

),

payments as (

    select
        *
    from
        {{ ref('stg_payments') }}

),


customer_orders as (

    select
        customer_id,

        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders,
        
    from orders

    group by 1

),

customer_totalpayments (
    
    select
        customer_id,

        sum(dollar_amount) as total
    from
        payments

    group by 1

),

final as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders,
        sum(dollar_amount)


    from customers

    left join customer_orders using (customer_id)
    left join payments using (order_id)
    left join customer_totalpayments using (customer_id)

)

select * from final