-- Q1) Viewed but never added to cart
-- Scenario: E-commerce funnel analytics.


SELECT DISTINCT v.user_id, v.product_id
FROM EventLogs v
WHERE v.event_type = 'VIEW'
AND NOT EXISTS (
 SELECT 1 FROM EventLogs c 
 WHERE c.user_id = v.user_id 
 AND c.product_id = v.product_id 
 AND c.event_type = 'ADD_TO_CART'
);
 
