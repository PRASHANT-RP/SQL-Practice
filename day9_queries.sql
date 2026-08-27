-- Q1) Salary diff with previous employee
-- Scenario: Using LAG() window function

SELECT 
    emp_name, 
    salary,
    salary - LAG(salary, 1) OVER (ORDER BY salary) AS salary_diff
FROM Employees;
