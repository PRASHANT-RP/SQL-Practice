-- Q1) Pivot table (Rows to Columns)
-- Scenario: Conditional aggregation using MAX(CASE WHEN...)

SELECT 
    year,
    MAX(CASE WHEN quarter = 'Q1' THEN revenue END) AS Q1_Revenue,
    MAX(CASE WHEN quarter = 'Q2' THEN revenue END) AS Q2_Revenue,
    MAX(CASE WHEN quarter = 'Q3' THEN revenue END) AS Q3_Revenue,
    MAX(CASE WHEN quarter = 'Q4' THEN revenue END) AS Q4_Revenue
FROM QuarterlySales
GROUP BY year;
