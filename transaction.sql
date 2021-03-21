-- Rachel Gultom
-- Software Engineer Intern Test at Moutar


-- CREATE DATABASE 
CREATE DATABASE toko_online

-- USE DATABASE
USE toko_online

-- CREATE CUSTOMER TABLE
CREATE TABLE customer(

customer_id INT(11) PRIMARY KEY NOT NULL,
name_ VARCHAR(50) NOT NULL,
gender VARCHAR (20) NOT NULL,
email VARCHAR (30) NOT NULL,
member_id INT(11)

)

-- INSERT DATA CUSTOMER
INSERT INTO customer VALUES (1,"budi","male","budi@gmail.com",001);
INSERT INTO customer VALUES (2,"sari","female","sari@gmail.com",002);
INSERT INTO customer VALUES (3,"udin","male","udin@gmail.com",003);
INSERT INTO customer VALUES (4,"rani","female","rani@gmail.com",004);
INSERT INTO customer VALUES (5,"marco","male","marco@gmail.com",005);


-- CREATE PRODUCT TABLE
CREATE TABLE product(

product_id INT(11) PRIMARY KEY NOT NULL,
product_name VARCHAR(50) NOT NULL,
product_size INT(11) NOT NULL,
product_price INT(11) NOT NULL,
product_desc VARCHAR(50) NOT NULL

)

-- INSERT DATA PRODUCT
INSERT INTO product VALUES (1,"Laptop",200,5000000,"Laptop Asus kualitas original");
INSERT INTO product VALUES (2,"Keyboard",100,50000,"Keyboard Asus kualitas original");
INSERT INTO product VALUES (3,"Mouse",50,30000,"Mouse Asus kualitas original");
INSERT INTO product VALUES (4,"Headset",100,200000,"Headset Asus kualitas original");
INSERT INTO product VALUES (5,"Charger Laptop",150,250000,"Charger Laptop kualitas original");


-- CREATE TRANSACTION TABLE
CREATE TABLE transaction_ (

transaction_id INT(11) NOT NULL,
customer_id INT(11) NOT NULL,
product_id INT(11) NOT NULL,
FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE,
FOREIGN KEY (product_id) REFERENCES product (product_id) ON DELETE CASCADE,
PRIMARY KEY(customer_id, product_id)

)

-- ALTER TRANSACTION TABLE
ALTER TABLE transaction_ ADD waktu DATETIME NOT NULL;


-- SQL
-- Please create query to get best seller product for male and female.
SELECT product_name , COUNT(o.transaction_id) AS bestSeller FROM product p
LEFT JOIN transaction_ o ON o.product_id = p.product_id
GROUP BY p.product_id

-- Please create query to get customer that spends the most money.
SELECT name_ , COUNT(o.transaction_id) AS totalPembelian FROM customer c 
LEFT JOIN transaction_ o ON o.customer_id = c.customer_id
GROUP BY c.customer_id

-- Please create query to show number of transactions for every 2 hours.
-- 1
SELECT customer_id, DATE(waktu), HOUR(waktu), product_id, COUNT(*)
FROM transaction_
GROUP BY customer_id, DATE(waktu), HOUR(waktu), product_id
HAVING COUNT(*)>=2

-- 2
SELECT * FROM transaction_ WHERE waktu <=DATE_SUB(NOW(),INTERVAL 2 HOUR);

