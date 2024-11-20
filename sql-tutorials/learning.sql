--! Mariadb Version all code must be run in mariadb container

--! Create Database
CREATE DATABASE db_tutorials;

--! delete database
DROP DATABASE db_tutorials;

--! Create Table
CREATE TABLE employees (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  email VARCHAR(50),
  salary DECIMAL(10,2),
);

CREATE TABLE departments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50)
);

--! Delete Table
DROP TABLE employees;

--! Rename Table
ALTER TABLE employees RENAME TO employees_new; 

--! Alter Table
ALTER TABLE employees ADD COLUMN department_id INT;

--! Drop Column
ALTER TABLE employees DROP COLUMN department_id;

--! Rename Column
ALTER TABLE employees RENAME COLUMN name TO first_name;

--! Insert Data
INSERT INTO employees (name, email, salary, department_id) VALUES ('John Doe', 'oQGtU@example.com', 5000.00, 1);

--! Insert Multiple Rows
INSERT INTO employees (name, email, salary, department_id) VALUES
  ('Jane Doe', '2MlP0@example.com', 6000.00, 2),
  ('Bob Smith', '7oEwO@example.com', 7000.00, 1);

--! Update Data
UPDATE employees SET salary = 5500.00 WHERE id = 1;

--! Delete Data
DELETE FROM employees WHERE id = 2;

--! Select Data
SELECT * FROM employees;

--! Select Specific Columns
SELECT name, email FROM employees;

--! Select Specific Rows
SELECT * FROM employees WHERE id = 1;

--! Select Specific Rows and Columns
SELECT name, email FROM employees WHERE id = 1;

--! Select Alias
SELECT e.name AS employee_name, e.email AS employee_email, d.name AS department_name
FROM employees e
JOIN departments d ON e.department_id = d.id;

--! Select order by
SELECT * FROM employees ORDER BY salary DESC;

--! Select Group By name
SELECT name, COUNT(*) AS employee_count FROM employees GROUP BY name; 

--! select limit
SELECT * FROM employees LIMIT 5;

--! select offset
SELECT * FROM employees LIMIT 5 OFFSET 2;

--! select distinct
SELECT DISTINCT name FROM employees;

--! select like
SELECT * FROM employees WHERE name LIKE '%Doe%';

--! select between
SELECT * FROM employees WHERE salary BETWEEN 100 AND 500;

--! select in
SELECT * FROM employees WHERE department_id IN (1, 2);

--! select not in
SELECT * FROM employees WHERE department_id NOT IN (1, 2);

--! select is null
SELECT * FROM employees WHERE department_id IS NULL;

--! select is not null
SELECT * FROM employees WHERE department_id IS NOT NULL;

--! select case
SELECT name, 
  CASE
    WHEN salary < 500 THEN 'Low'
    WHEN salary < 10000 THEN 'Medium'
    ELSE 'High'
  END AS salary_level
FROM employees;

--! select if
SELECT name, 
  IF(salary < 500, 'Low', IF(salary < 10000, 'Medium', 'High')) AS salary_level
FROM employees;

--! select ifnull
SELECT name, 
  IFNULL(department_id, 'No department') AS department_name
FROM employees;

--! select nullif
SELECT name, 
  NULLIF(department_id, 1) AS department_name
FROM employees;

--! select coalesce [if department_id is null then No department]
SELECT name, 
  COALESCE(department_id, 'No department') AS department_name
FROM employees;

--! select greatest
SELECT name, 
  GREATEST(salary, 200) AS highest_salary
FROM employees;

--! select least
SELECT name, 
  LEAST(salary, 200) AS lowest_salary
FROM employees;

--! select abs
SELECT name, 
  ABS(salary) AS absolute_salary
FROM employees;

--! select round
SELECT name, 
  ROUND(salary, 2) AS rounded_salary
FROM employees;

--! select truncate
SELECT name, 
  TRUNCATE(salary, 2) AS truncated_salary
FROM employees;

--! select concat
SELECT CONCAT(name, ' ', email) AS full_name
FROM employees;

--! select length
SELECT name, 
  LENGTH(name) AS name_length
FROM employees;

--! select substring
SELECT name, 
  SUBSTRING(name, 1, 3) AS first_three_letters
FROM employees;

--! select upper
SELECT name, 
  UPPER(name) AS uppercase_name
FROM employees;

--! select lower
SELECT name, 
  LOWER(name) AS lowercase_name
FROM employees;

--! select replace
SELECT name, 
  REPLACE(name, 'Doe', 'Smith') AS name_with_replaced_doe
FROM employees;

--! select trim
SELECT name, 
  TRIM('   John Doe   ') AS trimmed_name
FROM employees;

--! select ltrim
SELECT name, 
  LTRIM('   John Doe   ') AS trimmed_name
FROM employees;

--! select rtrim
SELECT name, 
  RTRIM('   John Doe   ') AS trimmed_name
FROM employees;

--! select now
SELECT NOW() AS current_time;

--! select curdate
SELECT CURDATE() AS current_date;

--! select curtime
SELECT CURTIME() AS current_time;

--! select date_format
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s') AS formatted_date_time;

--! select date_add
SELECT DATE_ADD(NOW(), INTERVAL 1 DAY) AS tomorrow;

--! select subquery
SELECT name, email, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

--! select join
SELECT e.name, e.email, d.name AS department_name
FROM employees e
JOIN departments d ON e.department_id = d.id;

--! select left join
SELECT e.name, e.email, d.name AS department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.id;

--! select right join
SELECT e.name, e.email, d.name AS department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.id;

--! select union
SELECT name, email, salary
FROM employees
WHERE department_id = 1
UNION
SELECT name, email, salary
FROM employees
WHERE department_id = 2;

--! select union all
SELECT name, email, salary
FROM employees
WHERE department_id = 1
UNION ALL
SELECT name, email, salary
FROM employees
WHERE department_id = 2;

--! select intersect
SELECT name, email, salary
FROM employees
WHERE department_id = 1
AND (name, email, salary) IN (
    SELECT name, email, salary
    FROM employees
    WHERE department_id = 2
);

--! select except
SELECT name, email, salary
FROM employees
WHERE department_id = 1
AND (name, email, salary) NOT IN (
    SELECT name, email, salary
    FROM employees
    WHERE department_id = 2
);

--! select cross join
SELECT e.name, e.email, d.name AS department_name
FROM employees e
CROSS JOIN departments d;

--! select self join
SELECT e1.name AS employee_name, e2.name AS manager_name
FROM employees e1
JOIN employees e2 ON e1.manager_id = e2.id;

--! select view
CREATE VIEW employees_view AS
SELECT emp.*, dep.name AS department_name
FROM employees AS emp
JOIN departments AS dep ON emp.department_id = dep.id;

--! remove view
DROP VIEW employees_view;

--! select stored procedure
DELIMITER //
CREATE PROCEDURE get_employees()
BEGIN
  SELECT * FROM employees;
END //
DELIMITER ;