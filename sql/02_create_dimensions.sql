-- DIM DATE 
create table dim_date (
	date_id date primary key
	,year int
	,quarter int
	,month int
	,month_name varchar(20)
	,week int
	,day int
	,day_name varchar(20)
	,day_of_week int
	,is_weekend int
	)

insert into dim_date
with recursive date_range as (
	select
		date(min(order_purchase_timestamp)) as date_id
	from orders
	union all
	select
		date_add(date_id, interval 1 day)
	from date_range
	where date_id < (
		select
			date(max(order_purchase_timestamp))
		from orders
			)
	)
select
	date_id
	,year(date_id) 			as year
	,quarter(date_id) 		as quarter
	,month(date_id) 		as month
	,monthname(date_id) 	as month_name
	,week(date_id, 3) 		as week
	,day(date_id) 			as day
	,dayname(date_id) 		as day_name
	,weekday(date_id) + 1 	as day_of_week
	,case
	when weekday(date_id) in (5, 6) then 1
	else 0
	end as is_weekend
from date_range

-- DIM CUSTOMER
create view dim_customer as 
select 
	customer_id
	,customer_unique_id
	,customer_zip_code_prefix
	,customer_city
	,customer_state 
from customers

-- DIM SELLERS
create view dim_sellers as
select
	seller_id
	,seller_zip_code_prefix
	,seller_city
	,seller_state
from sellers

-- DIM PRODUCTS
create view dim_products as
select 
	p.product_id
	,p.product_category_name
	,p.product_weight_g
	,p.product_length_cm
	,p.product_height_cm
	,p.product_width_cm
	,pc.product_category_name_english
from products p
left join product_category_name_translation pc 
on p.product_category_name = pc.product_category_name
