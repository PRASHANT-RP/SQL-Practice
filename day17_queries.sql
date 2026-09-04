-- Q1) Organizational tree (Recursive)
-- Scenario: Recursive CTE query

WITH RECURSIVE OrgHierarchy AS (
    -- Anchor Member: Find top level (CEO / Manager IS NULL)
    SELECT 
        emp_id, 
        emp_name, 
        manager_id, 
        1 AS level
    FROM Employees 
    WHERE manager_id IS NULL

    UNION ALL

    -- Recursive Member: Join with CTE to find employees at next levels
    SELECT 
        e.emp_id, 
        e.emp_name, 
        e.manager_id, 
        o.level + 1
    FROM Employees e
    JOIN OrgHierarchy o ON e.manager_id = o.emp_id
)
SELECT * 
FROM OrgHierarchy 
ORDER BY level;
