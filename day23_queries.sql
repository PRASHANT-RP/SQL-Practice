-- Q1) First-time vs Returning buyers per day
-- Scenario: Window MIN date comparison.

WITH UserFirstOrder AS (
 SELECT user_id, MIN(order_date) AS first_date
 FROM Orders GROUP BY user_id
)
  
SELECT o.order_date,
 COUNT(DISTINCT CASE WHEN o.order_date = f.first_date THEN o.user_id END) AS 
new_buyers,
 COUNT(DISTINCT CASE WHEN o.order_date > f.first_date THEN o.user_id END) AS 
returning_buyers
FROM Orders o
JOIN UserFirstOrder f ON o.user_id = f.user_id
GROUP BY o.order_date;
