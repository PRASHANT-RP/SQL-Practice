-- Q1) Top 2 selling products per category
-- Scenario: Dense Rank partitioned by category.

WITH CategoryRank AS (
 SELECT 
  category_id,
  product_id,
  SUM(sales) AS total_sales,
 DENSE_RANK() OVER (PARTITION BY category_id ORDER BY SUM(sales) DESC) AS rnk
 FROM Products GROUP BY category_id, product_id
)

SELECT
  category_id,
  product_id,
  total_sales
FROM CategoryRank
WHERE rnk <= 2;
