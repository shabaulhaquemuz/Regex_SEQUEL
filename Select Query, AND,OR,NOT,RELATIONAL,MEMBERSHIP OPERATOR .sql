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
SELECT * FROM CUSTOMER WHERE 20 NOT IN (ADDRESS_ID);

SELECT * FROM CUSTOMER WHERE ADDRESS_ID IN (20);
SELECT * FROM CUSTOMER WHERE ADDRESS_ID NOT IN (10,20);

SELECT * FROM CUSTOMER WHERE ADDRESS_ID NOT IN (SELECT ADDRESS_ID FROM CUSTOMER WHERE ADDRESS_ID != 20);
select * from customer where address_id not in(select address_id from customer where address_id!= 30);
select * from customer where address_id not in(select address_id from customer where customer_id!=20 and customer_id!=21);
select * from customer where address_id not in(select address_id from customer where customer_id!=20 and customer_id!=21);
select * from customer where address_id not in(select address_id from customer where customer_id!=25);



 