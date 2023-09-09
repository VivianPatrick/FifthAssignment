-- creating a database
USE Inventory_db,

-- creating a table
CREATE TABLE users (
id int NOT NULL,
username varchar (255) NOT NULL,
password varchar (255) NOT NULL,
PRIMARY KEY (id)
)

 SHOW TABLES

CREATE TABLE admin (
id int NOT NULL,
Firstname varchar (255) NOT NULL,
Lastname varchar (255) NOT NULL,
email_address varchar (255),
phone_number varchar (255),
home_address varchar (255),
country varchar (255),
user_id int,
FOREIGN KEY (user_id) REFERENCES users (id),
PRIMARY KEY (id)
)

CREATE TABLE customers (
id int NOT NULL,
Firstname varchar (255) NOT NULL,
Lastname varchar (255) NOT NULL,
email_address varchar (255),
phone_number varchar (255),
home_address varchar (255),
country varchar (255),
user_id int,
FOREIGN KEY (user_id) REFERENCES users (id),
PRIMARY KEY (id)
)

CREATE TABLE category (
id int NOT NULL,
name varchar (255),
description varchar (255),
PRIMARY KEY (id)
)

CREATE TABLE product (
id int NOT NULL,
name varchar (255),
size varchar (255),
price varchar (255),
brand varchar (255),
description varchar (255),
quantity int,
category_id int,
customer_id int,
FOREIGN KEY (category_id) REFERENCES category (id),
FOREIGN KEY (customer_id) REFERENCES customers (id),
PRIMARY KEY (id)
)

CREATE TABLE orders (
id int NOT NULL,
status enum('Completed',' Uncompleted'),
payment_status enum ('Successful', 'Not_successful'),
product_id int,
customer_id int,
FOREIGN KEY (product_id) REFERENCES product (id),
FOREIGN KEY (customer_id) REFERENCES customers (id),
PRIMARY KEY (id)
)
 SHOW TABLES
-- inserting data into the table
insert into users 
(id, username, password) 
values (1, 'Vivian Nzekwe', 'Vivian123')

 insert into users 
(id, username, password) 
values (2, 'Kingsley Obi', 'Kingsley123')

 insert into users 
(id, username, password) 
values (3, 'Kenneth Okonkwo', 'Ken123')

 insert into admin 
(id, Firstname, Lastname, email_address, phone_number, home_address, user_id) 
values (1, 'Vivian', 'Nzekwe', 'Vivian@gmail.com', 08146211455,'No 14 street Abuja Nigeria', 1)

 insert into admin 
(id, Firstname, Lastname, email_address, phone_number, home_address, user_id) 
values (2,'Tunde','Bashir', 'Bahir@gmail.com1455',0814526754, 'Abuja Nigeria', 2)

 insert into customers
(id, Firstname, Lastname, email_address, phone_number, home_address,country, user_id)
values (1, 'Gloria','Fred', 'gloria@gmail.com', 070456125, 'ave strt Lagos', 'Nigeria', 1)

 insert into customers
(id, Firstname, Lastname, email_address, phone_number, home_address,country, user_id)
values (2,'Philip','Ben','ben@gmail.com', '0715632485','Oba strt Abuja', 'Nigeria', 2)

insert into category 
(id, name, description)
values (1, 'food', 'Snacks')

insert into category 
(id, name, description)
values (2,'Bag', 'Fashion')

insert into product
(id, name, size, price, brand, description, quantity, category_id, customer_id)
values (1, 'Fish', 'Big', 3000, 'Titus', 'Frozen', 12, 1, 2)

insert into product
(id, name, size, price, brand, description, quantity, category_id, customer_id)
values (2,'Shoe',42, 6000, 'Nike', 'Fashion', 1, 2, 1)

insert into orders
(id, status,payment_status, product_id, customer_id)
 values (1,'Completed', 'Successful', 1,2)

 insert into orders
 (id, status,payment_status, product_id, customer_id)
 values (2,'Completed','successful',2,1)

-- selecting data from the table
select * from users

select username from users where id = 1

select * from product

select name, price from product where id = 2 or quantity = 12

select * from category

-- updating data in the table
update category 
set name = 'cake'
where id = 1

 select * from admin


update admin
set phone_number = 0701564284
where id = 2

select * from customers

-- deleting data from the table
delete from admin
where id = 1

 select * from product

delete from orders
where id = 1

select * from orders