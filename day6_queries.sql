-- Q1) Total salary in each department (COALESCE to handle NULL)

SELECT 
    d.dept_name, 
    COALESCE(SUM(e.salary), 0) AS total_salary
FROM Departments d
LEFT JOIN Employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name;


-- Q2) Active users per month in 2026 (Date grouping using EXTRACT)

SELECT 
    EXTRACT(MONTH FROM active_date) AS month, 
    COUNT(DISTINCT user_id) AS active_users
FROM UserActivity
WHERE EXTRACT(YEAR FROM active_date) = 2026
GROUP BY EXTRACT(MONTH FROM active_date);


-- Q3) Top 3 highest paid employees in each department (Window Function with PARTITION BY)

WITH RankedEmp AS (
    SELECT 
        emp_name, 
        dept_id, 
        salary,
        DENSE_RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS rnk
    FROM Employees
)
SELECT dept_id, emp_name, salary
FROM RankedEmp
WHERE rnk <= 3;
