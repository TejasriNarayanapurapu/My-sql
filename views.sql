
-- create a table
CREATE TABLE customers (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  city TEXT NOT NULL
);
-- insert some values
INSERT INTO customers VALUES (1, 'Ryan', 'Brazil');
INSERT INTO customers VALUES (2, 'Joanna', 'losangels');
INSERT INTO customers VALUES (3, 'teja', 'Brazil');
INSERT INTO customers VALUES (4, 'sai', 'paris');
INSERT INTO customers VALUES (5, 'gopi', 'Brazil');
INSERT INTO customers VALUES (6, 'Jyti', 'losangels');
-- fetch some values
SELECT * FROM customers;

CREATE VIEW Brazil_customers AS
SELECT name, id
FROM customers
WHERE city = 'Brazil';
SELECT * FROM Brazil_customers;

CREATE OR REPLACE VIEW Brazil_customers AS 
SELECT name, id, city
FROM customers 
WHERE city = 'losangels';
SELECT * FROM Brazil_customers;

DROP VIEW Brazil_customers;
SELECT * FROM Brazil_customers;