-- Employees who earn more than managers (Self-Join Scenario)
SELECT e.emp_name AS Employee
FROM Employees e
JOIN Employees m ON e.manager_id = m.emp_id
WHERE e.salary > m.salary;


-- No department employees (Handling NULL values)
SELECT * 
FROM Employees 
WHERE dept_id IS NULL;
