##subqueries 
##`q21  Find all orders where the amount is greater than the average order amount.
select order_id,amount as greater_amount
from shop.order_1
where amount>(
select avg(amount)
from shop.order_1);

##q22 Find orders whose amount is less than the average order amount.
select order_id,amount as lesser_avg_amount
from shop.order_1
where amount<(
select avg(amount)
from shop.order_1);

##q23 Find the order(s) with the highest amount using a subquery.
select order_id,amount as highest_amount
from shop.order_1
where amount>=(
select max(amount)
from shop.order_1);

			
##q24 Find the order(s) with the lowest amount using a subquery.
select order_id,amount as lowest_amount
from shop.order_1
where amount<=( select
min(amount) from shop.order_1);

##q25 Find the customers who have placed at least one order greater than ₹5,000.
select customer_name
from shop.customers 
where customer_id in (
select customer_id
from shop.order_1 
where amount>=5000);

##q26 Find the customers who have placed an order with the highest amount.
select customer_name 
from shop.customers 
where customer_id in (
select customer_id
from shop.order_1
where amount=(
select max(amount)
from shop.order_1)
);

##27 Find all orders whose amount is greater than the highest order amount placed by customer 1.
select order_id,amount
from shop.order_1
where amount>(
select max(amount)
from shop.order_1
where customer_id=1 
);

##q28 Find customers whose total spending is greater than ₹6,000.
select customer_name 
from shop.customers 
where customer_id in (
select customer_id 
from shop.order_1 
group by customer_id 
having sum(amount)>6000 );

##q29 Find the orders whose amount is greater than the average amount of orders placed by customer 1 (Arun)
select order_id,amount
from shop.order_1
where amount>(
select avg(amount)
from shop.order_1
where customer_id=1
);

##q30 Find the customer who has the second-highest total spending.

select c.customer_name,sum(o.amount) as second_total_spending 
from shop.customers c
join shop.order_1 o
on c.customer_id=o.customer_id 
group by customer_name 
order by second_total_spending desc
limit 1 offset 1;




