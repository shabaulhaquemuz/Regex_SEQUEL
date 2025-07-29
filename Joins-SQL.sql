use sakila;
CREATE TABLE t3 (
    id INT
);
INSERT INTO t1 (id) VALUES (1), (2), (3),(4),(5);

CREATE TABLE t4 (
    id INT
);
INSERT INTO t4 (id) VALUES (1),(2),(1), (3), (4);
SELECT *
FROM t3
INNER JOIN t4
ON t3.id = t4.id;


select * from customer;
select * from payment;
select first_name,amount from customer inner join payment on customer.customer_id=payment.payment_id;