-- DQL(Data Query Language)
use sakila;
show tables;

-- *:(asterix means all)
select * from customer;

-- select col1_name, col2_name from table_name(to select particular columns)
select customer_id,first_name,email from customer;

-- Operators:
-- 1. Arithmetic operator(+,-,*,/,//,%,**)
-- check datatype before applying arithmetic operator(its a good practice)
describe customer;  -- describe is used to check the details of all columns

-- applying arithmetic operators now
select customer_id,email from customer;
select customer_id+1,email from customer; # started from  2

select 120/3 as result;  -- #as means alias..An alias is a temporary name given to a table or column in SQL to make the output simpler or more readable.
select 120*3 as result; -- in layman, it is a name representation of an arithmetic expression.
                        -- Using a column alias to name the result of an arithmetic expression

-- In SQL, // is NOT valid for division.
-- // is Python syntax for integer division (floor division).

-- /*  ..... */   it is used for multiline comments
/*
| **Operation**    | **SQL Operator**          |
| ---------------- | ------------------------- |
| Normal Division  | `/`                       |
| Integer Division | Use `FLOOR()` or `CAST()` |
*/
-- WHERE is a clause used to filter out specific rows from a table based on given conditions.
select * from customer where store_id=1 and active=0;  -- fetch result if both store_id=1 and active=0, means true for both scenario
select * from customer where store_id=1 or active=0;   -- fetch result even if one stuation is true
select * from customer where customer_id=1;
SELECT * FROM customer WHERE customer_id != 3 AND customer_id != 1;  -- exclude customer_id=1 and 3
select *from customer where customer_id <> 1 and customer_id <> 3;
select *from customer where not customer_id=1;


SELECT * FROM customer WHERE NOT (customer_id = 3 and customer_id = 1); -- Syntax is correct, 
-- But logic is unnecessary. Why? because A customer_id cannot be 3 and 1 at the same time.

SELECT * FROM customer WHERE NOT (customer_id = 3 or customer_id = 1); # filter out where c_id !=1 and !=3
SELECT * FROM customer WHERE NOT (customer_id = 3 or customer_id = 1 or customer_id=2); # c_id other than 1,2,3

use sakila;
show tables;

-- select 10//3 as result; (it will give error)
-- select 10**3 as result;  (it will also give error) 

-- relational operator: >,<,>=,<=,=,!=
select * from customer;
select * from customer where store_id=2;
select * from customer where store_id=2 and active=0;


-- relational operator:=
-- 1. greater than(>)
select * from customer where address_id>50;
-- 2. greater than(>=)
select * from customer where address_id>=50;

-- 3. less than
select * from customer where address_id<50;

-- 4.less than equals to
select * from customer where address_id>=50;

-- 5. not equals to
select * from customer where address_id!=50;

-- 6. equals to(assginment)
select * from customer where address_id=50;

select * from customer where not(active!=0);
-- between is also a relational operator
-- BETWEEN is a special operator in SQL used to check if a value falls inside an inclusive range.
select * from customer where customer_id between 5 and 20;  -- 5 and 20  are included
select * from customer where customer_id >=5 and customer_id <=20;  -- between is same as this


-- membership operator : to check if a value is present in any iterable
-- 1. IN OPERATOR: Checks if a value belongs to a set of values.
SELECT * FROM CUSTOMER WHERE 20 IN (ADDRESS_ID);

-- 2. NOT IN OPERATOR: NOT IN is used to get the rows where the column's value is not found in the given list.
-- Parentheses are used for lists in IN() or NOT IN(), but if you write just (ADDRESS_ID), 
-- it is interpreted as a single-column list, not a tuple
-- In SQL, (10, 20, 30) is a list of scalar values, not a tuple.
-- It's called an "IN list" or "value list".
-- SELECT * FROM orders WHERE (customer_id, order_id) IN ((1, 101), (2, 102), (3, 103));
-- Here, ((1, 101), (2, 102)) are tuples because you’re comparing pairs of values.

SELECT * FROM CUSTOMER WHERE 20 NOT IN (ADDRESS_ID);

SELECT * FROM CUSTOMER WHERE ADDRESS_ID IN (20);
SELECT * FROM CUSTOMER WHERE ADDRESS_ID NOT IN (10,20);

SELECT * FROM CUSTOMER WHERE ADDRESS_ID NOT IN (SELECT ADDRESS_ID FROM CUSTOMER WHERE ADDRESS_ID != 20);
select * from customer where address_id not in(select address_id from customer where address_id!= 30);
select * from customer where address_id not in(select address_id from customer where customer_id!=20 and customer_id!=21);
select * from customer where address_id not in(select address_id from customer where customer_id!=20 and customer_id!=21);
select * from customer where address_id not in(select address_id from customer where customer_id!=25);

select * from customer where address_id not in(select address_id from customer where customer_id!=20);


-- LIKE : The LIKE operator is used in SQL to perform pattern-based searches on string or text data.
-- It allows you to filter records by matching partial values instead of exact values.

-- This query will return all customers whose names contain the letter 'a' anywhere in the name.
SELECT * FROM customer WHERE first_name LIKE '%a%';

-- will return first letter 
SELECT * FROM customer WHERE first_name LIKE 'a%';

SELECT * FROM customer WHERE first_name LIKE 'a%';

-- 3 times a anywhere in the string
SELECT * FROM customer WHERE first_name LIKE '%a%a%a%'; 

-- insert row
INSERT INTO customer 
(customer_id, store_id, first_name, last_name, email, address_id, active, create_date, last_update)
VALUES 
(601, 1, 'shabaulshabaul', 'Khan', 'shabaulshabaul@example.com', 10, 1, CURRENT_DATE, CURRENT_TIMESTAMP);

-- for 1 or more than 1 a
SELECT * FROM customer WHERE first_name LIKE '%a%'; 

-- for 2 or more than 2 a
SELECT * FROM customer WHERE first_name LIKE '%a%a%'; 
-- for 3 or more than 3 a
SELECT * FROM customer WHERE first_name LIKE '%a%a%a%'; 

-- for 4 or more than 4 a
SELECT * FROM customer WHERE first_name LIKE '%a%a%a%a%'; 

-- where starting and end letters are not a and b
select * from customer where first_name not like 'a%' and first_name not like 'b%';
-- where starting and end letters are not a,b,s and m.
select * from customer where first_name not like 'a%' and first_name not like 'b%' and first_name not like 's%' and first_name not like 'm%';

-- aggregate function: Aggregate functions perform a calculation on a set (group) of values and return a single value.
--  1. COUNT()
-- it is mainly used to return the number of rows.
-- Includes non-NULL values only (when column name is given).
use sakila;
select * from customer;
show tables;
select * from payment;
select max(amount) as max_amount from payment;
select min(amount) as min_amount from payment;
select avg(amount) as avg_amount from payment;
select sum(amount) as sum_amount from payment;
select power(2,3) as power;
select count(*) as total_words from customer;
select abs(-90) as positive;

select * from staff;
select max(address_id) from staff;
select * from customer;
select max(address_id) from customer;

SELECT MAX(customer_id) as max_value FROM customer WHERE customer_id BETWEEN 1 AND 10;

select sum(address_id) from customer where customer_id between 10 and 15;

select avg(address_id) as active0 from customer where active=0;


-- limit
-- LIMIT means how many rows you want to see.
select * from customer limit 5;

-- offset
-- OFFSET is used to skip rows from the top of the result.
select * from customer limit 5 offset 5;

-- string functions
-- 1.concat() use to concatenate two strings 
select concat("shabaul"," ","haque") as name;
select concat(first_name," ",last_name) as full_name from customer;

select lower(first_name) from customer;
select upper(last_name) from customer;

select substr("shabaul",2);
select substr("shabaul",3);
select substr("shabaul",2,3);
select left("shabaul",2);
select right("shabaul",3);

select * from customer where first_name like '%a%';
select * from customer;

-- locate function
-- The LOCATE() function is used to find the position of a substring (like a letter or word) inside another string
-- 🔸 POSITION() is an SQL standard function
-- 🔸 LOCATE() is MySQL-specific (but more flexible)
SELECT POSITION('a' IN 'Shabaul');
select locate("b","shabaul");



select locate("A",first_name),first_name from customer;

SELECT SUBSTRING(first_name, LOCATE('a', first_name) + 1, 2) FROM customer WHERE first_name LIKE '%a%';



 