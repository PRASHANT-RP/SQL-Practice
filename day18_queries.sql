-- Q1) Unpivot columns into rows
-- Scenario: Using UNION ALL to convert columns into rows

SELECT 
    product_id, 
    'Q1' AS quarter, 
    Q1_Revenue AS revenue 
FROM QuarterlySales

UNION ALL

SELECT 
    product_id, 
    'Q2' AS quarter, 
    Q2_Revenue AS revenue 
FROM QuarterlySales;
