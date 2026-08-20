-- Q1) Delete Duplicate Records using CTE and ROW_NUMBER()
WITH cte AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS row_num 
    FROM USERS
)
DELETE FROM cte WHERE row_num > 1;


-- Q2) Name starts with 'A' and ends with 'N'
SELECT * 
FROM EMPLOYEES 
WHERE emp_name LIKE 'A%N';


-- Q3) First and Last Records
-- First Record
SELECT * FROM Employees WHERE id = (SELECT MIN(id) FROM Employees);

-- Last Record
SELECT * FROM Employees WHERE id = (SELECT MAX(id) FROM Employees);
