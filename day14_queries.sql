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
