-- Q1) Salary diff with previous employee
-- Scenario: Using LAG() window function

SELECT 
    emp_name, 
    salary,
    salary - LAG(salary, 1) OVER (ORDER BY salary) AS salary_diff
FROM Employees;


-- Q2) Next salary in department
-- Scenario: Using LEAD() window function with PARTITION BY

SELECT 
    emp_name, 
    dept_id, 
    salary,
    LEAD(salary, 1) OVER (PARTITION BY dept_id ORDER BY salary) AS next_salary
FROM Employees;
