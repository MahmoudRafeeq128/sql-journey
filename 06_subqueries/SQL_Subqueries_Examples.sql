
-- ================================================
-- SQL Subqueries Examples with Explanations
-- ================================================

-- 1. Simple Subquery in WHERE clause
-- Get employees whose age is greater than the average age
SELECT gender, age
FROM employee_demographics
WHERE age > (
    SELECT AVG(age)
    FROM employee_demographics
);

-- 2. Subquery in SELECT clause
-- Show each employee's name and the average salary in the company
SELECT first_name, last_name,
    (SELECT AVG(salary) FROM employee_salary) AS avg_salary
FROM employee_salary;

-- 3. Subquery in FROM clause (used as a derived table)
-- List employees who earn more than 5000
SELECT *
FROM (
    SELECT first_name, salary
    FROM employee_salary
    WHERE salary > 5000
) AS high_earners;

-- 4. Multi-row Subquery
-- Find employees who are in departments located in location_id 1700
SELECT first_name
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location_id = 1700
);

-- 5. Correlated Subquery
-- List employees who earn more than the average salary of their department
SELECT e1.first_name, e1.salary
FROM employee_salary e1
WHERE salary > (
    SELECT AVG(e2.salary)
    FROM employee_salary e2
    WHERE e1.department_id = e2.department_id
);

-- 6. Subquery with multiple columns
-- Find employees whose (department_id, job_id) pair exists in job_history table
SELECT first_name, last_name
FROM employees
WHERE (department_id, job_id) IN (
    SELECT department_id, job_id
    FROM job_history
);
