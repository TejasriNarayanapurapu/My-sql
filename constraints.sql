-- constraints
CREATE TABLE students (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  gender TEXT ,
  personid INTEGER NOT NULL ,
  CONSTRAINT CHK_students CHECK (id>=2 AND gender='M')
);
-- insert some values
INSERT INTO students VALUES (4, 'Ryan', 'M',4);
INSERT INTO students VALUES (2, 'Joanna', 'M',5);
INSERT INTO students VALUES (3, 'Joaa', 'M',6);
-- fetch some values
SELECT * FROM students;
ALTER TABLE students
MODIFY gender TEXT NOT NULL;
-- primary key
CREATE TABLE student (
  id INTEGER NOT NULL,
  name TEXT NOT NULL,
  gender TEXT,
stdno INTEGER NOT NULL,
    CONSTRAINT pk_person PRIMARY KEY(id,stdno)
);
SELECT * FROM student;

-- foriegn key,check
CREATE TABLE persons (
    personid INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    Age INTEGER NOT NULL,
    CHECK (Age>=30)
);
INSERT INTO persons VALUES (1, 'Ryan', 30);
INSERT INTO persons VALUES (2, 'Joanna', 45);
SELECT * FROM persons;
-- table orders
CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    personid int,
    PRIMARY KEY(OrderID),
    FOREIGN KEY (personid) REFERENCES persons(personid)
    );

-- default values
CREATE TABLE employee (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  village VARCHAR(200) DEFAULT 'vijayawada'
);
ALTER TABLE employee 
ALTER village DROP DEFAULT;
ALTER TABLE employee AUTO_INCREMENT=10; 
INSERT INTO employee VALUES(id,name,village);
INSERT INTO employee VALUES(1,'teja','x');
SELECT * FROM employee;




