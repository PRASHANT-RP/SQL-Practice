-- Q1) Bought Product A but never Product B
-- Scenario: EXCEPT / MINUS or NOT IN Subquery

SELECT DISTINCT customer_id
FROM Orders
WHERE product_name = 'Product A'
  AND customer_id NOT IN (
      SELECT customer_id 
      FROM Orders 
      WHERE product_name = 'Product B'
  );

