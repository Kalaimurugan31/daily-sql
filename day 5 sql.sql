##q1 Assign a row number to each order, with the highest amount getting row number 1.
select order_id, amount,row_number()over(order by amount desc) as row_num
from shop.order_1;



##q2 Rank the orders from highest amount to lowest amount using RANK().
select order_id, amount,rank()over(order by amount desc)
from shop.order_1;

##q3 Rank all orders from highest amount to lowest amount using DENSE_RANK()
select order_id,amount,dense_rank()over(order by amount desc) as dense_rank_num
from shop.order_1;


##q4Give each customer's orders a row number, starting from 1 for each customer.
select order_id,customer_id,amount, row_number() over(partition by customer_id order by amount desc )
from shop.order_1;

##q5Rank each customer's orders from highest amount to lowest amount using RANK() and PARTITION BY.
select order_id,customer_id,amount,rank()over(partition by customer_id order by amount desc)
from shop.order_1;

##q6 Find the highest order for each customer using ROW_NUMBER() and a CTE.
with rank_order as(
select customer_id,order_id,amount,row_number()over(partition by customer_id order by amount desc
) AS row_num
from shop.order_1
)
select * from rank_order
where row_num=1;


##q7 show each order and calculate the running total of order amounts.
select order_id,sum(amount) over(order by order_id)as running_total
from shop.order_1;

##q8 Running Total for Each Customer
select customer_id,amount,order_id,sum(amount) over ( partition by customer_id order by order_id) as running_total
from shop.order_1;

##q9 Show each order's amount and the previous order's amount.(lag)
select customer_id,order_id,lag(amount)over(order by order_id )
from shop.order_1;

##q10 Show each order's amount and the next order's amount.(lead)
select customer_id,order_id,amount,lead(amount)over(order by order_id )
from shop.order_1








