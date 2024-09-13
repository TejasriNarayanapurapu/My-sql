
-- create
CREATE TABLE students (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  gender TEXT NOT NULL,
  pid INTEGER NOT NULL
);
-- insert some values
INSERT INTO students VALUES (1, 'Ryan', 'M','3');
INSERT INTO students VALUES (2, 'Joanna', 'F','5');
-- fetch some values
SELECT * FROM students;
CREATE INDEX idx_id
ON students(id);
ALTER TABLE students
DROP INDEX idx_id;
CREATE INDEX idx_sid
ON students(id,pid);