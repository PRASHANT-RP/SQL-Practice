-- Q1) Customer Lifetime Value (CLV)
-- Scenario: Aggregate total spending per customer.

SELECT c.customer_id, c.customer_name,
 SUM(o.total_amount) AS lifetime_value
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY lifetime_value DESC;
