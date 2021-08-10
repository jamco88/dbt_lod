{% docs order_status %}

One of the following values: 

| status         | definition                                       |
|----------------|--------------------------------------------------|
| placed         | Order placed, not yet shipped                    |
| shipped        | Order has been shipped, not yet been delivered   |
| completed      | Order has been received by customers             |
| return pending | Customer indicated they want to return this item |
| returned       | Item has been returned                           |

{% enddocs %}

{% docs payment_paymentmethod %}

One of the following values: 

| payment_method | definition                                       |
|----------------|--------------------------------------------------|
| credit_card    | A credit card                                    |
| coupon         | Some sort of coupon                              |
| bank_transfer  | A transfer, from a bank                          |
| gift_card      | A gift card of some sort                         |

{% enddocs %}
