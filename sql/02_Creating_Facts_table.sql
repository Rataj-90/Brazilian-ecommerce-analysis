-- FACT_ORDERS

create view fact_orders as
select 
  o.order_id
  ,o.customer_id
  ,o.order_status
  ,date(o.order_purchase_timestamp)        as order_purchase_date
  ,date(o.order_approved_at)               as order_approved_date
  ,date(o.order_delivered_carrier_date)    as order_delivered_carrier_date
  ,date(o.order_delivered_customer_date)   as order_delivered_customer_date
  ,date(o.order_estimated_delivery_date)   as order_estimated_delivery_date
  ,op.total_payment_value                  as total_payment_value
  ,ore.review_score                        as review_score
  ,datediff(
  date(o.order_delivered_customer_date) 
  ,date(o.order_purchase_timestamp))       as delivery_days
  ,datediff(
  date(o.order_delivered_customer_date) 
  ,date(o.order_estimated_delivery_date))  as delay_days
  ,case
  when date(o.order_delivered_customer_date) > date(o.order_estimated_delivery_date) then 1
  else 0  end                              as is_late_delivery
from orders o
left join (
select
  order_id
  ,sum(payment_value) as total_payment_value
from order_payments
group by order_id ) op        on o.order_id = op.order_id
left join (
select
  order_id
  ,avg(review_score)         as review_score
from order_reviews
group by order_id) ore        on o.order_id = ore.order_id


-- FACT_ORDER_ITEMS
create view fact_order_items as    
select 
o.order_id
,o.customer_id
,date(o.order_purchase_timestamp)                 as order_purchase_date
,oi.order_item_id
,oi.product_id
,oi.seller_id
,date(oi.shipping_limit_date)                        as shipping_limit_date
,oi.price
,oi.freight_value
,(oi.price + oi.freight_value)                         as total_item_value
from orders o
left join order_items oi on o.order_id = oi.order_id 


-- FACT_ORDER_PAYMENTS

create view fact_payments as
select
order_id
,payment_sequential
,payment_type
,payment_installments
, payment_value
from order_payments

select 
count(distinct(order_id))
from order_payments

