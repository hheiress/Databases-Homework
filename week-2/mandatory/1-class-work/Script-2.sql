CREATE TABLE customers (
  id        SERIAL PRIMARY KEY,
  name      VARCHAR(30) NOT NULL,
  email     VARCHAR(120) NOT NULL,
  address   VARCHAR(120),
  city      VARCHAR(30),
  postcode  VARCHAR(12),
  country   VARCHAR(20)
);

select * from customers;

drop table hotels cascade;

CREATE table hotels (
  id        SERIAL primary key,
  name      VARCHAR(30)  NOT NULL,
  rooms     INT,
  postcode  VARCHAR(20)  NOT NULL
);

CREATE TABLE bookings (
  id               SERIAL PRIMARY KEY,
  customer_id      INT REFERENCES customers(id),
  hotel_id         INT REFERENCES hotels(id),
  checkin_date     DATE NOT NULL,
  nights           INT NOT NULL
);



INSERT INTO customers (name, email, address, city, postcode, country) VALUES ('John Smith','j.smith@johnsmith.org','11 New Road','Liverpool','L10 2AB','UK');
INSERT INTO hotels (name, rooms, postcode) VALUES ('Triple Point Hotel', 10, 'CM194JS');
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (1, 1, '2019-10-01', 2);

INSERT INTO customers (name, email, address, city, postcode, country) VALUES ('Diana','diana@gmail.com','23 Road','Barcelona','08008','Spain');
INSERT INTO hotels (name, rooms, postcode) VALUES ('Royal Cosmos Hotel', 5, 'TR209AX');
INSERT INTO hotels (name, rooms, postcode) VALUES ('Pacific Petal Motel', 15, 'BN180TG');

SELECT * FROM customers;
SELECT * FROM hotels;
SELECT * FROM bookings;


SELECT name, address FROM customers;
SELECT * FROM hotels WHERE rooms > 7;
SELECT name,address FROM customers WHERE id = 1;
SELECT * FROM bookings WHERE checkin_date > '2019/10/01';
SELECT * FROM bookings WHERE checkin_date > '2019/10/01' AND nights >= 2;
SELECT * FROM hotels WHERE postcode = 'CM194JS' OR postcode = 'TR209AX';

SELECT * FROM customers WHERE name='Laurence Lebihan';
SELECT name FROM customers WHERE country ='UK';
SELECT name, city, postcode FROM customers WHERE name='Melinda Marsh';


SELECT * FROM hotels WHERE postcode = 'DGQ127';
SELECT * FROM hotels WHERE rooms > 11;
SELECT * FROM hotels WHERE rooms > 6 and rooms < 15;
SELECT * FROM hotels WHERE rooms = 10 or rooms = 20;


SELECT * FROM bookings WHERE id = 1;
SELECT * FROM bookings WHERE  nights > 4;
SELECT * FROM bookings WHERE checkin_date > '2020/01/01';
SELECT * FROM bookings WHERE checkin_date > '2020/01/01' AND nights > 4;


ALTER TABLE customers ADD COLUMN date_of_birth DATE;
ALTER TABLE customers RENAME column  date_of_birth TO birthdate;
ALTER TABLE customers DROP COLUMN birthdate;
SELECT * FROM customers;
update customers set date_of_birth = current_timestamp where id=1; 

update hotels set postcode = 'L10XYZ' where name = 'Elder Lake Hotel';
update hotels set rooms = 25 where name ='Cozy Hotel' ;
update customers set address = '2 Blue Street', city='Glasgow', postcode='G11ABC' where name ='Nadia Sethuraman' ; 
update bookings set nights = 5 where customer_id = 1 and hotel_id = 1;

select postcode from hotels where name = 'Elder Lake Hotel';
select rooms from hotels where name ='Cozy Hotel';
select address, city, postcode from customers where name ='Nadia Sethuraman' ;
select nights from bookings where customer_id = 1 and hotel_id = 1;


delete from bookings where customer_id = 8 and checkin_date = '2020-01-03';
select * from bookings where customer_id = 6;
delete from bookings where customer_id = 6;
select * from customers where id = 6;
delete from customers where id = 6;


select id from customers;
select customer_id from bookings;

select c.name
from customers c
join  bookings b
    on c.id = b.customer_id 

select name from customers where id = (
    select customer_id from bookings where id = 1
);

select * from bookings join customers on bookings.customer_id = customers.id where extract (year from bookings.checkin_date) = 2020;

select 
    bookings.checkin_date,
    bookings.nights,
    customers.name,
    customers.email,
    customers.address,
    customers.city,
    customers.postcode,
    customers.country 
from bookings
join customers
     on bookings.customer_id = customers.id 
where extract (year from bookings.checkin_date) = 2020 ;


select customers.name,
       bookings.checkin_date,
       bookings.nights
from bookings 
join customers
    on customers.id = bookings.customer_id 
join hotels 
    on hotels.id = bookings.hotel_id 
where hotels.name ='Jade Peaks Hotel' ;   
       
  
select bookings.checkin_date, customers.name as customer_name, hotels.name as hotel_name
from bookings 
join customers 
    on customers.id = bookings.customer_id 
join hotels 
    on hotels.id = bookings.hotel_id 
where bookings.nights > 5;  

SELECT bookings.checkin_date,customers.name,hotels.name FROM bookings
INNER JOIN customers ON customers.id=bookings.customer_id
INNER JOIN hotels ON hotels.id=bookings.hotel_id
WHERE customers.name LIKE 'M%'
ORDER BY hotels.name desc ;





