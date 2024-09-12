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
