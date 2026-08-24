##class 2 case and elif,subquery
##q11 Display each order amount and classify it as High, Medium, or Low.
select o.order_id,o.amount,
case 
    when amount>=5000 Then "high"
    when amount>=3000 Then "medium"
    else "low"
end as order_category
from shop.order_1 o;

##q12 Display each customer's name and their total spending, then classify the customer as:
select c.customer_name,sum(o.amount)  ,
case
when sum(o.amount)>5000 then "high"
when sum(o.amount)>= 3000 then "medium"
else "low" 
end as order_category
from shop.customers c
left join  shop.order_1 o
on c.customer_id=o.customer_id
group by c.customer_name ;

##q13 Find orders whose amount is greater than the average order amount.
select o.order_id,o.amount
from shop.order_1 o
where amount > (
               select avg(o.amount)
               from shop.order_1 o 
);    


##q14 Find customers whose total spending is greater than the average total spending of all customers.
select c.customer_name ,sum(o.amount) as customer_total
from shop.customers c
join shop.order_1 o
on c.customer_id=o.customer_id
group by customer_name
having sum(o.amount)>
(
select avg(customer_totals.total_spending)
from (
		select sum(o.amount) as total_spending
        from shop.order_1 o
        group by o.customer_id )
        as customer_totals);
        
##q15 Find the customers whose total spending is greater than ₹6,000 and classify them as High or Medium.
select c.customer_name,sum(o.amount) as total_spending,
case
 when sum(o.amount)>=7000 then "high"
 when sum(o.amount)>=6000 then "medium"
 else "low"
 end as order_category
from shop.customers c
join shop.order_1 o
on c.customer_id=o.customer_id
group by customer_name
having sum(o.amount)>6000;
##q16 Find the customer who has placed the highest number of orders, and display their total spending as well.
select c.customer_name,count(o.order_id)as highest_number_of_order ,sum(o.amount)as total_spending
from shop.customers c
join shop.order_1 o
on c.customer_id=o.customer_id
group by c.customer_name 
order by count(o.order_id) desc
limit 1;

##q17Find the customer who has the highest total spending and display their name, city, and total spending.
select c.customer_name,c.city,sum(o.amount) as total_spending
from shop.customers c
join shop.order_1 o
on c.customer_id=o.customer_id
group by c. customer_name,c.city
order by sum(o.amount) desc
limit 1;

##q18Find the customer with the lowest total spending.
select c.customer_name,sum(o.amount) as total_spending
from shop.customers c
join shop.order_1 o
on c.customer_id=o.customer_id
group by customer_name
order by sum(o.amount) asc
limit 1;
##q19 Find the customer who placed the most expensive single order. Display the customer name, order ID, and amount.
select c.customer_name,o.order_id,o.amount as expensive_single_order
from shop.customers c
join shop.order_1 o
on c.customer_id=o.customer_id
order by o.amount desc
limit 1;

##20Find the total revenue generated from orders above ₹3,000.
select sum(amount) as total_revenue
from shop.order_1
where amount>=3000;
