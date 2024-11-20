--! select view
CREATE VIEW employees_view AS
SELECT emp.*, dep.name AS department_name
FROM employees AS emp
JOIN departments AS dep ON emp.department_id = dep.id;

--! Updating a View
CREATE OR REPLACE VIEW employees_view AS
SELECT 
    emp.*, 
    dep.name AS department_name,
    CASE
        WHEN emp.salary < 500 THEN 'Low'
        WHEN emp.salary < 10000 THEN 'Medium'
        ELSE 'High'
    END AS salary_level
FROM employees AS emp
JOIN departments AS dep ON emp.department_id = dep.id;



--! remove view
DROP VIEW employees_view;

--! get data from view
SELECT name, department_name, salary, salary_level
FROM employees_view;