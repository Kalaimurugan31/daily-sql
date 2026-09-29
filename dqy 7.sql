##String functions are used to clean, change, and analyze text data
select upper("data analyst");
##lower case
select lower("DATA ANALYST");
##len of character
select length("data analyst");
##trim space remove
select trim("          data analyst"      );
##concat()
select concat("data"," " ,"analyst");
##left
select left("data analyst",4);
##right
select right("data analyst",7);

##substring()
select substring("kalaimurugan",3,4);
##replace()
select replace( "kalaimurugansql","kalai","python");
##locate
select locate("n","kalaimurugan");
##instr
select instr("kalaimurugan","n") ;

##mixed sql query
select upper("Data Analyst");
##len of character
select length("kalaimurugan");
##remove extra spaces
select trim("data analyst  ");
##combine three words
select concat("kalaimurugan"," ","Data Analyst");
##exact first five characters
select left("kalaimurugan",5);
##last five characters
select right("kalaimurugan",7);
##substring "laim"
select substring("kalaimurugan",3,4);
##replace()
select replace("kalaimurugansql","sql","python");
##locate
select locate("murugan","kalaimurugan");
##instr
select instr("kalaimurugan","n");
##Convert "Data Analyst" to lowercase and remove any extra spaces around it.
select lower(trim("Data Analyst"));
##Combine these two values with a space
select concat("kalaimurugan"," ","sql");
##Write one query using both LEFT() and RIGHT()
select 
left("kalaimurugan sql",5) as left_five,
right("kalaimurugan sql",7) as last_seven;
##From "kalaimurugansql", use SUBSTRING() and REPLACE() to
select replace("kalaimurugansql","sql","python");
## Removes extra spaces → TRIM()Converts everything to lowercase → LOWER()
##Replaces sql with python → REPLACE()
select trim(lower(replace("kalaimurugan sql","sql","python")));
