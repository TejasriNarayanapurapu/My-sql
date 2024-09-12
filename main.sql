-- create a table
CREATE TABLE students (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  gender TEXT NOT NULl,
  address TEXT NOT NULL
);
-- insert some values
INSERT INTO students VALUES (1, 'Ryan', 'M','NULL');
INSERT INTO students VALUES (2, 'Joanna', 'F','NULL');
INSERT INTO students VALUES (3, 'teja', 'M','mg road');
INSERT INTO students VALUES (4, 'sai', 'F','NULL');
-- fetch some values
SELECT * FROM students WHERE gender = 'F';
SELECT * FROM students WHERE gender = 'M';
DELETE FROM students WHERE id = '1';
SELECT * FROM students;
SELECT id,name FROM students;
SELECT * FROM students 
WHERE gender = 'M';
-- update table values
UPDATE students
SET name = 'Alfred', gender = 'M'
WHERE id = 2;
SELECT * FROM students;
ALTER TABLE students
ADD Email varchar(255);
SELECT * FROM students;
ALTER TABLE students
DROP COLUMN Email;
SELECT * FROM students;
ALTER TABLE students
RENAME COLUMN name to firstname;
SELECT * FROM students;
TRUNCATE TABLE students;
DROP TABLE students; 
SELECT * FROM students;

-- aggregate functions

CREATE TABLE Orders (
    OrderID int PRIMARY KEY,
    name TEXT NOT NULL,
    fee TEXT NOT NULL
);
INSERT INTO Orders VALUES('1','BOX','10');
INSERT INTO Orders VALUES('2','BOX','20');
INSERT INTO Orders VALUES('3','THING','30');    
SELECT * FROM Orders;
SELECT MIN(fee)
FROM Orders;
SELECT MAX(fee)
FROM Orders;
SELECT COUNT(OrderID)
FROM Orders;
SELECT SUM(fee)
FROM Orders;
SELECT AVG(fee)
FROM Orders;

-- create a table
CREATE TABLE students (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  gender TEXT NOT NULL
);
-- insert some values
INSERT INTO students VALUES (1, 'Ryan', 'M');
INSERT INTO students VALUES (2, 'teja', 'M');
INSERT INTO students VALUES (3, 'sai', 'F');
INSERT INTO students VALUES (4, 'tava', 'F');
INSERT INTO students VALUES (5, 'Joanna', 'M');
-- fetch some values
SELECT * FROM students;

SELECT * FROM students
WHERE name = 'Ryan' AND gender = 'M';
SELECT * FROM students
WHERE name = 'Ryan' OR gender = 'M';
SELECT * FROM students
WHERE NOT gender = 'M';

SELECT * FROM students
ORDER BY gender;
SELECT * FROM students
ORDER BY name;

SELECT id,gender
FROM students
WHERE gender IS NULL;
SELECT id,gender
FROM students
WHERE gender IS NOT NULL;

UPDATE students
SET gender = 'M';
SELECT * FROM students;
UPDATE students
SET gender = 'F' 
WHERE id = '1';
SELECT * FROM students;

SELECT * FROM students LIMIT 3 OFFSET 1;
SELECT * FROM students LIMIT 3;

SELECT * FROM students
WHERE name LIKE 'a%';
SELECT * FROM students
WHERE name LIKE '%t';
SELECT * FROM students
WHERE name LIKE 't%a';

SELECT * FROM students 
WHERE id IN (1,2);

SELECT * FROM students 
WHERE id BETWEEN 3 AND 5;

-- aliases
SELECT gender AS male
FROM students;
SELECT gender 
FROM students AS student;

-- joins
CREATE TABLE orders (
  cstid INTEGER PRIMARY KEY,
  sprid TEXT NOT NULL,
  odrid TEXT NOT NULL
);
-- insert some values
INSERT INTO orders VALUES (1 ,   2    ,      7);
INSERT INTO orders VALUES (2   ,   35   ,     2);
INSERT INTO orders VALUES (5 ,   45   ,     1);
-- fetch some values
SELECT * FROM orders;

CREATE TABLE customer (
  cstid INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  address TEXT NOT NULL
);
-- insert some values
INSERT INTO customer VALUES (1,'x','mgroad');
INSERT INTO customer VALUES (2,'y','benzroad');
INSERT INTO customer VALUES (3,'z','ssit');
-- fetch some values
SELECT * FROM customer;

-- inner join 
SELECT orders.cstid,customer.name,orders.sprid
FROM orders
INNER JOIN customer ON orders.cstid = customer.cstid;

-- left join 
SELECT orders.sprid,orders.cstid
FROM orders
LEFT JOIN customer ON orders.cstid = customer.cstid;

-- right join
SELECT orders.cstid,customer.name,customer.address
FROM orders
RIGHT JOIN customer ON orders.cstid = customer.cstid;

-- cross join
SELECT orders.cstid,customer.name,customer.address
FROM orders
CROSS JOIN customer;

-- SELF JOIN 
SELECT A.name AS name1, B.name AS name2, A.address
FROM customer A, customer B
WHERE A.cstid <> B.cstid
AND A.address = B.address
ORDER BY A.address;
SELECT * FROM customer;

-- union
SELECT name FROM customer
UNION
SELECT cstid FROM orders;

-- group by
SELECT COUNT(cstid),address
FROM customer
GROUP BY address;

-- having
SELECT COUNT(cstid),address
FROM customer
GROUP BY address
ORDER BY COUNT(cstid) > 2;
-- exsists
SELECT name
FROM customer
WHERE EXISTS (SELECT cstid FROM orders WHERE orders.cstid = customer.cstid);

-- any,all
SELECT name
FROM customer
WHERE cstid = ANY
  (SELECT cstid
  FROM orders
  WHERE sprid = 35);
SELECT name
FROM customer
WHERE cstid = ANY
  (SELECT cstid
  FROM orders
  WHERE sprid > 55); -- we get false here
-- all 
SELECT ALL name
FROM customer
WHERE TRUE;

SELECT name
FROM customer
WHERE cstid = ALL
  (SELECT cstid
  FROM orders
  WHERE sprid = 99); -- we get false here

-- insert into select 
INSERT INTO orders
SELECT * FROM customer
WHERE address;

-- case 
SELECT cstid, address,
CASE
    WHEN cstid > 1 THEN 'The addresses are printed'
    WHEN cstid = 55 THEN 'The address is prakasham barrage'
    ELSE 'The addresses are not printed '
END AS cstidTEXT
FROM customer;

SELECT * FROM customer;
ALTER TABLE customer
ADD fee varchar(20);
SELECT * FROM customer;
UPDATE customer
SET fee = 20;
SELECT * FROM customer;
UPDATE customer
SET fee = '30'
WHERE cstid = '2';
SELECT * FROM customer;
UPDATE customer
SET fee = '50'
WHERE cstid = '3';
SELECT * FROM customer;
-- null ,coalesce
SELECT name, cstid * (fee + IFNULL(fee, 0))
FROM customer;
SELECT name, cstid * (fee + COALESCE(fee, 0))
FROM customer;
