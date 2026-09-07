-- Q1) Bought item A and B on same day
-- Scenario: Self join with date equality

SELECT DISTINCT 
    o1.user_id, 
    o1.order_date
FROM Orders o1
JOIN Orders o2 
    ON o1.user_id = o2.user_id 
   AND o1.order_date = o2.order_date
WHERE o1.item = 'Item A' 
  AND o2.item = 'Item B';
