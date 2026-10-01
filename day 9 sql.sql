##📚 SQL Class — UNION & UNION ALL
##q1
SELECT 'Arun' AS customer_name
UNION
SELECT 'Priya';
##output=arun,priya

##q-2
SELECT 'Arun' AS customer_name
UNION ALL
SELECT 'Arun';
##output=arun,arun

##3.Suppose we want to combine: customers from Chennai customers from Bangalore
select customer_name
from shop.customers
where city="chennai"
union
select customer_name
from shop.customers
where city="banglore";

## q.4 union all
select customer_name
from shop.customers
where city="chennai"
union all
select customer_name
from shop.customers
where city="banglore";

## q-5 Can we do this?
SELECT customer_id, customer_name
FROM shop.customers
UNION
SELECT customer_name
FROM shop.customers;
## No because for union we have use same column for each query 
##have to use customer_id for second query
##q-6 Can we do this?
SELECT customer_id
FROM shop.customers
UNION
SELECT customer_name
FROM shop.customers;
## no because for union we have to use same data type for each query

##q-7 UNION with duplicates
##Table A:Arun Priya Ravi   Table B:Priya Ravi Kumar
SELECT customer_name FROM table_a
UNION
SELECT customer_name FROM table_b;
##👉 How many unique names will the result contain?
## output: arun priya ravi kumar

##8-8 Which one should you use if you want to combine two result sets and keep all duplicate rows?
##A) UNION   B) UNION ALL
##output: union all




