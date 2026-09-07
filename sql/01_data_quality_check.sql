-- Duplicate checks - primary identifiers

select
  order_id
  ,count(*) as cnt
from orders
group by order_id
having count(*) > 1

select
  customer_id
  ,count(*) as cnt
from customers
group by customer_id
having count(*) > 1

select
  product_id
  ,count(*) as cnt
from products
group by product_id
having count(*) > 1

select
  seller_id
  ,count(*) as cnt
from sellers
group by seller_id
having count(*) > 1

-- order_items is stored at order item level.
-- multiple rows per order_id are expected.
select
  order_id
  ,order_item_id
  ,count(*) as cnt
from order_items
group by
order_id
,order_item_id
having count(*) > 1
-- no duplicate records found for order item grain:
-- one row = one product position within one order


-- review_id is not unique in this dataset.
-- some reviews are linked to more than one order.
select
  review_id
,count(distinct order_id) as orders
from order_reviews
group by review_id
having count(distinct order_id) > 1


-- Null / empty value checks

select
  sum(customer_id is null or trim(customer_id) = '')                as customer_id_missing
  ,sum(customer_unique_id is null or trim(customer_unique_id) = '') as customer_unique_id_missing
  ,sum(customer_zip_code_prefix is null)                            as customer_zip_code_prefix_missing
  ,sum(customer_city is null or trim(customer_city) = '')           as customer_city_missing
  ,sum(customer_state is null or trim(customer_state) = '')         as customer_state_missing
from customers

select
  sum(geolocation_zip_code_prefix is null)                         as geolocation_zip_code_prefix_missing
  ,sum(geolocation_lat is null)                                    as geolocation_lat_missing
  ,sum(geolocation_lng is null)                                    as geolocation_lng_missing
  ,sum(geolocation_city is null or trim(geolocation_city) = '')    as geolocation_city_missing
  ,sum(geolocation_state is null or trim(geolocation_state) = '')  as geolocation_state_missing
from geolocation

select
  sum(order_id is null or trim(order_id) = '')                         as order_id_missing
  ,sum(order_item_id is null)                                          as order_item_id_missing
  ,sum(product_id is null or trim(product_id) = '')                    as product_id_missing
  ,sum(seller_id is null or trim(seller_id) = '')                      as seller_id_missing
  ,sum(shipping_limit_date is null or trim(shipping_limit_date) = '')  as shipping_limit_date_missing
  ,sum(price is null)                                                  as price_missing
  ,sum(freight_value is null)                                          as freight_value_missing
from order_items

select
  sum(order_id is null or trim(order_id) = '')           as order_id_missing
  ,sum(payment_sequential is null)                       as payment_sequential_missing
  ,sum(payment_type is null or trim(payment_type) = '')  as payment_type_missing
  ,sum(payment_installments is null)                     as payment_installments_missing
  ,sum(payment_value is null)                            as payment_value_missing
from order_payments

select
  sum(review_id is null or trim(review_id) = '')                               as review_id_missing
  ,sum(order_id is null or trim(order_id) = '')                                as order_id_missing
  ,sum(review_score is null)                                                   as review_score_missing
  ,sum(review_comment_title is null or trim(review_comment_title) = '')        as review_comment_title_missing
  ,sum(review_comment_message is null or trim(review_comment_message) = '')    as review_comment_message_missing
  ,sum(review_creation_date is null or trim(review_creation_date) = '')        as review_creation_date_missing
  ,sum(review_answer_timestamp is null or trim(review_answer_timestamp) = '')  as review_answer_timestamp_missing
from order_reviews
-- missing review comments are expected.
-- customers can submit only a review score without a written comment.


select  
  sum(order_id is null or trim(order_id) = '')                                            as order_id_missing
  ,sum(customer_id is null or trim(customer_id) = '')                                     as customer_id_missing
  ,sum(order_status is null or trim(order_status) = '')                                   as order_status_missing
  ,sum(order_purchase_timestamp is null or trim(order_purchase_timestamp) = '')           as order_purchase_timestamp_missing
  ,sum(order_approved_at is null or trim(order_approved_at) = '')                         as order_approved_at_missing
  ,sum(order_delivered_carrier_date is null or trim(order_delivered_carrier_date) = '')   as order_delivered_carrier_date_missing
  ,sum(order_delivered_customer_date is null or trim(order_delivered_customer_date) = '') as order_delivered_customer_date_missing
  ,sum(order_estimated_delivery_date is null or trim(order_estimated_delivery_date) = '') as order_estimated_delivery_date_missing
from orders
-- missing order_approved_at values are expected.
-- some orders were created but never approved.

-- missing order_delivered_carrier_date values are expected.
-- orders that were cancelled or not shipped do not have a carrier delivery date.

-- missing order_delivered_customer_date values are expected.
-- cancelled, unavailable or undelivered orders do not have a customer delivery date.

select
  sum(product_category_name is null or trim(product_category_name) = '')                    as product_category_name_missing
  ,sum(product_category_name_english is null or trim(product_category_name_english) = '')   as product_category_name_english_missing
from product_category_name_translation

select
  sum(product_id is null or trim(product_id) = '')                           as product_id_missing
  ,sum(product_category_name is null or trim(product_category_name) = '')    as product_category_name_missing
  ,sum(product_name_lenght is null)                                          as product_name_lenght_missing
  ,sum(product_description_lenght is null)                                   as product_description_lenght_missing
  ,sum(product_photos_qty is null)                                           as product_photos_qty_missing
  ,sum(product_weight_g is null)                                             as product_weight_g_missing
  ,sum(product_length_cm is null)                                            as product_length_cm_missing
  ,sum(product_height_cm is null)                                            as product_height_cm_missing
  ,sum(product_width_cm is null)                                             as product_width_cm_missing
from products

select *
from products
where product_category_name is null
-- 610 products do not contain descriptive metadata.
-- These records were retained because they have a valid product_id
-- and can still be used in further analysis.

select
  sum(seller_id is null or trim(seller_id) = '')         as seller_id_missing
  ,sum(seller_zip_code_prefix is null)                   as seller_zip_code_prefix_missing
  ,sum(seller_city is null or trim(seller_city) = '')    as seller_city_missing
  ,sum(seller_state is null or trim(seller_state) = '')  as seller_state_missing
from sellers
