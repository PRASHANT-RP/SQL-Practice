-- Q1) Percentage contribution to sales
-- Scenario: Window SUM OVER() without PARTITION

SELECT 
    product_id, 
    sales_amount,
    ROUND(
        (sales_amount / SUM(sales_amount) OVER()) * 100, 
        2
    ) AS pct_contribution
FROM ProductSales;


-- Q2) Median salary in department
-- Scenario: PERCENTILE_CONT comparison

SELECT 
    dept_id,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY salary) AS median_salary
FROM Employees
GROUP BY dept_id;


