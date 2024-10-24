- We can enter into a table by running following command in the shell

```SQL
\c your_database_name
```


- We can create a table inside a db using following syntax.

```SQL
CREATE TABLE table_name 
(
  column1 datatype constraint,
  column2 datatype constraint,
  column3 datatype constraint,
  ...
);
```
- Below are some examples of creating tables
- 
```SQL
CREATE TABLE students 
(
student_id SERIAL PRIMARY KEY,
student_name VARCHAR(50) NOT NULL,
age INTEGER CHECK (age > 0),
email VARCHAR(50) UNIQUE,
frontend_mark INTEGER CHECK (frontend_mark >= 0 AND frontend_mark <= 100),
backend_mark INTEGER CHECK (backend_mark >= 0 AND backend_mark <= 100),
status VARCHAR(10)
);
```
```SQL
CREATE TABLE courses 
(
  course_id SERIAL PRIMARY KEY,
  course_name VARCHAR(100) NOT NULL,
  credits INTEGER NOT NULL
);
```
```SQL
CREATE TABLE enrollment 
(
enrollment_id SERIAL PRIMARY KEY,
student_id INTEGER REFERENCES students(student_id),
course_id INTEGER REFERENCES courses(course_id)
);
```
- We can insert data into a table using following syntax.

```SQL
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
```

- Below are some examples of inserting data into a table

```SQL
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark)
VALUES('Sameer', 21, 'sameer@example.com', 48, 60),
('Zoya', 23, 'zoya@example.com', 52, 58),
('Nabil', 22, 'nabil@example.com', 37, 46),
('Rafi', 24, 'rafi@example.com', 41, 40),
('Sophia', 22, 'sophia@example.com', 50, 52),
('Hasan', 23, 'hasan@example.com', 43, 39)
```

```SQL
INSERT INTO courses (course_name, credits)
VALUES
('Next.js', 3),
('React.js', 4),
('Database', 3),
('Prisma', 3)
```
```SQL
INSERT INTO enrollment (student_id, course_id) VALUES (1,1), (1,2), (2,1), (3,2)
```

- Now try to practice by yourself using following queries.

Query 1:
Insert a new student record with the following details:

Name: YourName
Age: YourAge
Email: YourEmail
Frontend-Mark: YourMark
Backend-Mark: YourMark
Status: NULL
Note: You can choose random values for the frontend_mark, backend_mark, and other fields (except NULL for the status).

Query 2:
Retrieve the names of all students who are enrolled in the course titled 'Next.js'.

Sample Output:

student_name
Sameer
Zoya
Query 3:
Update the status of the student with the highest total (frontend_mark + backend_mark) to 'Awarded'.

Query 4:
Delete all courses that have no students enrolled.

Query 5:
Retrieve the names of students using a limit of 2, starting from the 3rd student.

Sample Output:

student_name
Nabil
Rafi
Query 6:
Retrieve the course names and the number of students enrolled in each course.

Sample Output:

course_name	students_enrolled
Next.js	2
React.js	2
Query 7:
Calculate and display the average age of all students.

Sample Output:

average_age
22.33
Query 8:
Retrieve the names of students whose email addresses contain 'example.com'.

Sample Output:

student_name
Sameer
Zoya
Nabil
Rafi
Sophia

- Below you will find the solution for the above queries.

Query 1:

```SQL
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status)
VALUES ('Md Enayetur Rahman', 37, 'enayet@example.com', 48, 60, NULL)
```

Query 2:

```SQL
SELECT student_name FROM students WHERE student_id IN (SELECT student_id FROM enrollment WHERE course_id = (SELECT course_id FROM courses WHERE course_name = 'Next.js'))
```
Query 3:

```SQL
UPDATE students 
    SET status = 'Awarded'
    WHERE frontend_mark+backend_mark = ( SELECT MAX(frontend_mark+backend_mark) FROM students)
```

Query 4:

```SQL
DELETE FROM courses WHERE course_id NOT IN(SELECT course_id FROM enrollment)
```

Query 5:

```SQL
SELECT student_name FROM students LIMIT 2 OFFSET 1
```

Query  6:

```SQL
SELECT courses.course_name, COUNT(enrollment.student_id) AS students_enrolled FROM courses  LEFT JOIN enrollment ON courses.course_id = enrollment.course_id GROUP BY courses.course_name ORDER BY students_enrolled DESC
```

Query 7:

```SQL
SELECT AVG(age) as average_age FROM students
```

Query 8:

```SQL
SELECT student_name from students where email LIKE '%example.com'
```