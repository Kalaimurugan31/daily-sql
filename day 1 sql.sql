create database shop;
##table 1
create table shop.customers
(
customer_id int,
customer_name varchar(50),
city varchar(50)
);
insert shop.customers values 
(1,"arun","chennai"),
(2,"priya","chennai"),
(3,"ravi","banglore");
select * from shop.customers;

##table 2
create table shop.order_2
(order_id int primary key,
customer_id int,
amount int);

insert shop.order_1 values
(101,1,5000),
(102,1,3000),
(103,2,7000),
(104,3,2000);

select * from  shop.order_1 ;

##q1 find each customer total order
select c.customer_name,sum(o.amount)
from shop.customers c
join shop.order_1 o
on c.customer_id=o.customer_id
group by customer_name;

##q2 find customer where total order ampunt is greater than 5000
select c.customer_name,sum(o.amount) as total_order_amount
from shop.customers c
join shop.order_1 o
on c.customer_id=o.customer_id
group by customer_name
having total_order_amount>5000;

##q3Find the number of orders placed by each customer
select c.customer_name,count(o.order_id) as number_of_orders
from shop.customers c
join shop.order_1 o
on c.customer_id=o.customer_id
group by customer_name;

##q4Find customers who have placed more than 1 order
select customer_name,count(o.order_id) as number_of_orders
from shop.customers c
join shop.order_1 o
on c.customer_id=o.customer_id
group by customer_name
having number_of_orders>1;
##q5 Find the city whose customers have generated the highest total order amount.
select c.city,sum(o.amount) as highest_total_order_amount
from shop.customers c
join shop.order_1 o
on c.customer_id=o.customer_id
group by c.city
order by  highest_total_order_amount desc
limit 1;
##q6 Find the top 3 customers based on their total spending.
select c.customer_name,sum(o.amount) as total_spending
from shop.customers c
join shop.order_1 o
on c.customer_id=o.customer_id
group by c.customer_name
order by total_spending desc
limit 3;

##q7 Find customers who have never placed an order.
select c.customer_name,o.order_id
from shop.customers c
left join shop.order_1 o
on c.customer_id=o.customer_id
where order_id is null;

##q8 find customer who has placed highest number of order
select c.customer_name,count(o.order_id) as highest_number_of_order
from shop.customers c
join shop.order_1 o
on c.customer_id=o.customer_id
group by customer_name 
order by highest_number_of_order desc
limit 1;
##q9 Find the average order amount for each city and show only cities where the average order amount is greater than ₹5,000.
select c.city,avg(o.amount)as average_order_amount
from shop.customers c
join shop.order_1 o
on c.customer_id=o.customer_id
group by c.city
having average_order_amount>5000;

##q10 Find the customer who spent the highest total amount.
select c.customer_name,sum(o.amount) as highest_total_amount
from shop.customers c
join shop.order_1 o
on c.customer_id=o.customer_id
group by customer_name
order by highest_total_amount desc
limit 1;


















