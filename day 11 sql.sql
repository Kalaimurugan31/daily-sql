##Advanced Window Functions

##q-1We want to assign a number to each order based on highest amount first.
select order_id,amount,row_number()over(order by amount desc) as rownumber
from shop.order_1;

##q-2 Now use RANK() instead of ROW_NUMBER().
select order_id,amount,rank()over(order by amount desc) as rank_number
from shop.order_1;

##q-3Understanding the difference
##suppose the order_id is (101,102,103,104) amount(7000,5000,5000,3000)
## answer is [1,3,3,5]

##q-4 For the same amounts:
##What ranks would DENSE_RANK() give?
##answer is[1,2,2,3]

##q-5 partition by 
select customer_id,order_id, amount, rank()over(partition by customer_id
order by amount desc) as partition_by_rank
from shop.order_1;

##q-6 Top order per customer Now find the highest-value order for each customer.
with rank_order as (
select customer_id,order_id,amount,row_number()over(partition by customer_id order by amount desc) as  highest_value_order
from shop.order_1
)
select * from rank_order
where highest_value_order = 1;

##q-7 lag
select customer_id,order_id,lag(amount)over(order by order_id) as lag_amount
from shop.order_1;

##q-8lead
select customer_id,order_id,lead(amount)over(order by order_id) as lead_amount
from shop.order_1;

##q-9
select customer_id,order_id,amount,lag(amount)over(order by order_id) as previous_amount,
amount-lag(amount)over(order by order_id) as difference_amount
from shop.order_1;

##10Which function looks at the next row's value?

#A) LAG()
#B) LEAD()
#C) RANK()
##answer=[b]
