CREATE TABLE students 
(
student_id SERIAL PRIMARY KEY,
student_name VARCHAR(50) NOT NULL,
age INTEGER CHECK (age > 0),
email VARCHAR(50) UNIQUE,
frontend_mark INTEGER CHECK (frontend_mark >= 0 AND frontend_mark <= 60),
backend_mark INTEGER CHECK (backend_mark >= 0 AND backend_mark <= 60),
status VARCHAR(10)
);

CREATE TABLE courses 
(
  course_id SERIAL PRIMARY KEY,
  course_name VARCHAR(100) NOT NULL,
  credits INTEGER NOT NULL
);

CREATE TABLE enrollment 
(
enrollment_id SERIAL PRIMARY KEY,
student_id INTEGER REFERENCES students(student_id),
course_id INTEGER REFERENCES courses(course_id)
);

INSERT INTO students (student_name, age, email, frontend_mark, backend_mark)
VALUES('Sameer', 21, 'sameer@example.com', 48, 60),
('Zoya', 23, 'zoya@example.com', 52, 58),
('Nabil', 22, 'nabil@example.com', 37, 46),
('Rafi', 24, 'rafi@example.com', 41, 40),
('Sophia', 22, 'sophia@example.com', 50, 52),
('Hasan', 23, 'hasan@example.com', 43, 39)


INSERT INTO courses (course_name, credits)
VALUES
('Next.js', 3),
('React.js', 4),
('Database', 3),
('Prisma', 3)


INSERT INTO enrollment (student_id, course_id) VALUES (1,1), (1,2), (2,1), (3,2)


INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status)
VALUES ('Md Enayetur Rahman', 37, 'enayet@example.com', 48, 60, NULL)


SELECT student_name FROM students WHERE student_id IN (SELECT student_id FROM enrollment WHERE course_id = (SELECT course_id FROM courses WHERE course_name = 'Next.js'))

UPDATE students 
    SET status = 'Awarded'
    WHERE frontend_mark+backend_mark = ( SELECT MAX(frontend_mark+backend_mark) FROM students)


DELETE FROM courses WHERE course_id NOT IN(SELECT course_id FROM enrollment)


SELECT student_name FROM students LIMIT 2 OFFSET 1


SELECT courses.course_name, COUNT(enrollment.student_id) AS students_enrolled FROM courses  LEFT JOIN enrollment ON courses.course_id = enrollment.course_id GROUP BY courses.course_name ORDER BY students_enrolled DESC


SELECT AVG(age) as average_age FROM students


SELECT student_name from students where email LIKE '%example.com'


-- 1. What is PostgreSQL?
-- PostgreSQL is a powerful, open source object-relational database system with over 35 years of active development that has earned it a strong reputation for reliability, feature robustness, and performance.

-- 2. What is the purpose of a database schema in PostgreSQL?
-- The purpose of database schema is to allow may users to use one database without interfering with each other. To organize database objects into logical groups to make them more manageable. To make it easier to maintain the database.

-- 3. Explain the primary key and foreign key concepts in PostgreSQL.
-- A special case of a unique constraint defined on a table or other relation that also guarantees that all of the attributes within the primary key do not have null values. As the name implies, there can be only one primary key per table, though it is possible to have multiple unique constraints that also have no null-capable attributes.
-- A type of constraint defined on one or more columns in a table which requires the value(s) in those columns to identify zero or one row in another (or, infrequently, the same) table.

-- 4. What is the difference between the VARCHAR and CHAR data types?
-- VARCHAR stores variable-length strings and only uses as much space as needed, making it ideal for data with varying lengths. CHAR, on the other hand, stores fixed-length strings, padding with spaces if necessary, and is best for fields with consistently sized data

-- 5. Explain the purpose of the WHERE clause in a SELECT statement.

-- The WHERE clause in a SELECT statement is used to filter records from the result set, returning only the rows that meet the specified condition. It allows you to specify criteria that each row must satisfy in order to be included in the query results.

-- 6. What are the LIMIT and OFFSET clauses used for?

-- The LIMIT clause is used to specify the maximum number of rows to return in a query result, allowing you to control the size of the result set. The OFFSET clause is used to skip a specified number of rows before starting to return rows, typically in conjunction with LIMIT for pagination or to retrieve a specific subset of results.

-- 7. How can you perform data modification using UPDATE statements?

-- We can modify data in a table using an UPDATE statement by specifying the table, setting the new values for one or more columns, and optionally using a WHERE clause to target specific rows. Without the WHERE clause, the UPDATE affects all rows in the table.

-- 8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?

-- The JOIN operation is significant because it allows you to combine rows from two or more tables based on a related column, enabling you to retrieve data that spans multiple tables. In PostgreSQL, a JOIN works by specifying a common field between the tables (usually a primary key and foreign key relationship), and it returns rows where the join condition is met.

-- 9. Explain the GROUP BY clause and its role in aggregation operations?

-- The GROUP BY clause in SQL is used to group rows that have the same values in specified columns, allowing you to perform aggregation operations (such as COUNT, SUM, AVG, etc.) on each group of data. It organizes the result set into groups based on the specified column(s) and applies aggregate functions to each group, making it useful for generating summary data.

-- 10. How can you calculate aggregate functions like COUNT, SUM, and AVG in PostgreSQL?

-- In PostgreSQL, we can calculate aggregate functions like COUNT, SUM, and AVG by using them in a SELECT statement, optionally combined with the GROUP BY clause to apply them to groups of rows.

-- 11. What is the purpose of an index in PostgreSQL, and how does it optimize query performance?

-- An index in PostgreSQL is a database structure that improves the speed of data retrieval operations by allowing the database to find rows more quickly, without scanning the entire table. It is a data structure that stores a subset of the table's data in a way that allows for efficient retrieval of rows based on specific columns.

-- 12. Explain the concept of a PostgreSQL view and how it differs from a table?

-- A view in PostgreSQL is a virtual table that is based on the result set of a SELECT query. It acts like a stored query, allowing you to query it like a table but without storing the data itself. Views are dynamically generated each time they are queried, so they always reflect the current state of the underlying tables.