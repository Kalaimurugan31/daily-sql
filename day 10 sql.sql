##SQL Class — Conditional Functions
##Today we'll focus mainly on IF(), because you've already practiced IFNULL() and COALESCE().
##IF() syntax IF(condition, value_if_true, value_if_false)

##q.1 What will this return?
SELECT IF(7000 > 5000, 'High', 'Low') as category;


##q.2 IF() with your table
select order_id,amount ,
if (amount >=5000,"high","low") as category
from shop.order_1;

##q.3 Now classify the orders: amount >= 5000 → High amount < 5000 → Low
SELECT order_id, amount,
IF(amount >= 5000, "high", "low") AS category
FROM shop.order_1;

##q.4IF() with text Using shop.customers, classify customers based on their city:
select city ,
if (city ="chennai","local","other") as category
from shop.customers;

##q.5 IF() + NULL Now consider that some customers may have NULL in city.
select city,
if(city is null ,"missing","available") as category
from shop.customers;

##q.6 IF() + amount Using shop.order_1, classify each order:
select amount,
if(amount >=5000,"eligible","not_eligible") as category
from shop.order_1;

##q.7 IF() + AND Now classify an order as High Value only when:
select amount,
if(amount>=5000 and amount <=7000 ,"high_value","other") as category
from shop.order_1;

##q.8 IF() + OR Classify an order as Priority when:
select amount,
if(amount=5000 or amount=7000,"priority","normal") as category
from shop.order_1;

##q.9 BETWEEN Classify the amount:
select amount,
if(amount between 5000 and 7000 ,"medium","other")as category
from shop.order_1;

##q.10 We need three categories:> 5000 → High ,= 5000 → Medium ,< 5000 → Low
select amount,
if(amount>5000,"high",
if(amount=5000,"medium","low")) as category
from shop.order_1















