-- Q1) 2nd highest Salary of an Employee
SELECT MAX(Salary) AS SecondHighestSalary 
FROM Employees 
WHERE Salary < (SELECT MAX(Salary) FROM Employees);

-- Q2) Nth Highest Salary using DENSE_RANK()
WITH RankedSalaries AS (
    SELECT Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) AS rnk 
    FROM EMPLOYEES
)
SELECT DISTINCT Salary 
FROM RankedSalaries 
WHERE rnk = N; -- Replace N with required rank number

-- Q3) FETCH DUPLICATE RECORDS
SELECT email, COUNT(email) AS cnt 
FROM Users 
GROUP BY email 
HAVING COUNT(email) > 1;
