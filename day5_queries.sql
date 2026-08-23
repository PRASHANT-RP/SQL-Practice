-- Q1) Departments with no employees (LEFT JOIN where right table key is NULL)
SELECT d.dept_name
FROM Departments d
LEFT JOIN Employees e ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;







-- Q2) Odd and Even Records using MOD operator
-- Even Records
SELECT * FROM Employees WHERE MOD(emp_id, 2) = 0;

-- Odd Records
SELECT * FROM Employees WHERE MOD(emp_id, 2) <> 0;
