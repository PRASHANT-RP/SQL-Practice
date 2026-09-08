-- Q1) Year-over-Year (YoY) growth
-- Scenario: Financial metric using LAG.

WITH YearlySales AS (
 SELECT EXTRACT(YEAR FROM order_date) AS yr, 
   SUM(amount) AS total_revenue
 FROM Orders 
 GROUP BY EXTRACT(YEAR FROM order_date)
)
SELECT yr, total_revenue,
 LAG(total_revenue) OVER (ORDER BY yr) AS prev_year_revenue,
 ROUND(((total_revenue - LAG(total_revenue) OVER (ORDER BY yr)) / 
LAG(total_revenue) OVER (ORDER BY yr)) * 100, 2) AS yoy_growth_pct
FROM YearlySales;
