-- Q1) Second order placed by customer
-- Scenario: ROW_NUMBER PARTITION BY customer

WITH RankedOrders AS (
    SELECT 
        order_id, 
        customer_id, 
        order_date,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id 
            ORDER BY order_date
        ) AS rn
    FROM Orders
)
SELECT 
    customer_id, 
    order_id, 
    order_date
FROM RankedOrders
WHERE rn = 2;

