use regex;
INSERT INTO EMPLOYEE2 (ID, DESIGNATION, NAME, SALARY)
VALUES 
(6, 'Clerk', 'Rohit', 30000.00),
(7, 'Developer', 'Anjali', 60000.00),
(8, 'Team Lead', 'shabaul', 85000.00),
(9, 'Designer', 'Kriti', 55000.00),
(10, 'Support', 'Raj', 40000.00);
-- 1️⃣ SELECT(View Data)
-- ViewAllData:
select * from employee2;

-- ViewSpecificColumns:
select name, salary from employee2;

-- Filter Data:
select * from employee2
where salary>50000;

select * from employee2
where salary>=40000;

-- not equals to 1. <>, !=
select name from employee2
where salary <> 50000;

select name from employee2
where salary != 50000;

-- To display data in ascending order of SALARY, use:
select * from employee2
order by salary asc;

-- to display data in descending order order of salary, use:
select * from employee2
order by salary desc;

-- using range
select  * from employee2
where salary between 40000 and 60000

-- another method of calculating range using relational operator(will give output if both output is true   )
select name from employee2 where salary>50000 and salary<90000;