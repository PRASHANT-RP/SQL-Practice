-- Highest salary in each department
SELECT dept_id, MAX(salary) AS max_salary
FROM Employees
GROUP BY dept_id;


-- Department with maximum employees
SELECT dept_id, COUNT(*) AS emp_count
FROM Employees
GROUP BY dept_id
ORDER BY emp_count DESC
LIMIT 1;


--  Joined in last 30 days (PostgreSQL / MySQL Syntax)
-- PostgreSQL Syntax:
SELECT * 
FROM Employees 
WHERE join_date >= CURRENT_DATE - INTERVAL '30 days';

-- MySQL Syntax:
-- SELECT * FROM Employees WHERE join_date >= CURRENT_DATE - INTERVAL 30 DAY;


-- No department employees (Handling NULL values)
SELECT * 
FROM Employees 
WHERE dept_id IS NULL;
