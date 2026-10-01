##1.null handling
select customer_name
from shop.customers
where customer_name is null;
##2.Now find all customers whose city is available (not NULL).
select customer_name
from shop.customers
where customer_name is not null;
##3.Now find all customers where city is NULL.
select customer_name,city
from shop.customers
where city is null;
##4.Now find customers whose city is not missing.
select customer_name,city
from shop.customers
where city is not null;
##5.Find how many customers have a missing city.
select count(*) as missing_city
from shop.customers
where city is null;
##63find how many customers have a city available.
select count(*) as availabe_customers
from shop.customers
where city is not null;
##7.whenever city is NULL, display Not Provided.
select customer_name,
coalesce(city,"not_provided") as city
from shop.customers;
##8.COALESCE() with numbers Suppose amount can contain NULL.
select order_id,
coalesce(amount,"0")as amount
from shop.order_1;
##9.IFNULL() is another way to replace a NULL value.
select customer_name,
ifnull(city,"unknown")as city
from shop.customers;
##10.How many total customers are there, including those with NULL city?
select count(*)
from shop.customers





