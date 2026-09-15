##📅 SQL Date & Time Functions
##Dates are very important in Data Analysis 
select curdate();
select now();
##time  Date Functions Q2 — YEAR(), MONTH(), DAY()
select 
year("2026-09-08") as year,
month("2026-09-08") as month,
day("2026-09-08") as day;

##Date Functions Q3 — DATEDIFF()
select datediff("2026-01-01","2026-09-08") as days_difference;	

##Date Functions Q4 — DATE_ADD() DATE_ADD() is used to add days, months, or years to a date.
select date_add("2026-09-08",interval 30 day);

##q5
select date_sub("2026-09-08",interval 30 day);

##q6 Extract month name
select monthname("2026-12-25") as month_name;

##q7 extract dayname
select dayname("2026-12-25") as day_name;

##q8 extract EXTRACT() is used to extract a specific part of a date.
select extract(month from "2026-12-25") as month;

##q9 LAST_DAY() returns the last date of a given month.
select last_day("2026-2-10") as last_date;

##q10
select last_day("2026-12-10") as last_date;

##q11 date_format
select date_format("2026-12-25","%M %d, %y") as date_format;

##q12Write a query to show only the year from order_date.
select year("2026-12-25") as year;

##q13 Find the month number from 2026-12-25 using MONTH().
select Month("2026-12-25") as month;

##q14Find the day number from 2026-12-25 using DAY().
select day("2026-12-25") as day;

##q15Find the full month name from 2026-12-25.
select monthname("2026-12-25") as month_name;

##q16Find the day of the week for 2026-12-25.
select dayname("2026-12-25") as day_name;