-- Q1) Orders in every month of 2025
-- Scenario: DISTINCT COUNT of months matching 12

SELECT customer_id
FROM Orders
WHERE EXTRACT(YEAR FROM order_date) = 2025
GROUP BY customer_id
HAVING COUNT(DISTINCT EXTRACT(MONTH FROM order_date)) = 12;
