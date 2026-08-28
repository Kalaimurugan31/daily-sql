##day 4
##CTE = Common Table Expression.
##q1-It lets you create a temporary named result first, and then use that result in your main query.
with customer_total as (
select customer_id,sum(amount) as total_spending
from shop.order_1
group by customer_id
)
select * from customer_total;

##q2-Create a CTE that calculates each customer's total spending, 
##then display only the customers whose total spending is greater than ₹6,000.
with customer_total as(
select customer_id,sum(amount) as total_spending
from shop.order_1
group by customer_id
)
select * from customer_total
where total_spending>6000;

##q3=Using a CTE, find the customer with the highest total spending.
with customer_total as(
select customer_id,sum(amount) as total_spending
from shop.order_1
group by customer_id
order by sum(amount) desc
limit 1
)
select * from customer_total
where total_spending>6000;

##q4Using a CTE, find the average total spending per customer.

with customer_total as (
select customer_id,sum(amount) as avg_total_spending
from shop.order_1
group by customer_id
)
select avg(avg_total_spending)
from customer_total;


