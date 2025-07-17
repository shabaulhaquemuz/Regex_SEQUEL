create database my_company;
use my_company;
create table employee(
emp_id int primary key,
emp_name varchar(30),
first_name varchar(30),
last_name varchar(30),
designation varchar(30),
salary float,
joining_date date
);
insert into employee(emp_id,emp_name,first_name,last_name,designation,salary,joining_date) values
(1, 'Shabaul Haque', 'Shabaul', 'Haque', 'Manager', 75000, '2023-03-15'),
(2, 'Syed Amaan', 'Syed', 'Amaan', 'Trainer', 55000, '2024-02-10'),
(3, 'Pritam Singh', 'Pritam', 'Singh', 'Developer', 60000, '2022-06-25'),
(4, 'Syed Rehan', 'Syed', 'Rehan', 'HR', 50000, '2023-08-05'),
(5, 'Jibran Ahmad', 'Jibran', 'Ahmad', 'Manager', 80000, '2025-01-20'),
(6, 'Afzal Khan', 'Afzal', 'Khan', 'Trainer', 57000, '2024-11-12'),
(7, 'Saud Mirza', 'Saud', 'Mirza', 'Developer', 62000, '2021-12-30');

-- to show tables in database my_company
show tables

-- to show data in table employee
SELECT * FROM employee;
use my_company;

select * from employee;

-- Q1: Filter employees whose joining date is between 2023 and 2024
select emp_name from employee where year(joining_date) between 2023 and 2024;

-- Q2: Filter employee names whose designation is NOT "HR"
select emp_name from employee where designation <> "hr";
-- Q2: Filter employee names whose designation is NOT "HR"
select emp_name from employee where designation != "hr";

-- Q3: Create a new column (virtual) as full_name using first name and last name
select emp_id, concat(first_name, " ", last_name) as full_name from employee;

-- Q4: Filter employees where designation is "Manager and Trainer" (both), 
-- and also "Manager or Trainer" (either one)

-- for or
select emp_name from employee where designation="Manager" or designation="Trainer";

-- for and
select emp_name from employee where designation="Manager" and designation="Trainer";