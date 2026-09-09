-- Q1) Churn Rate per month
-- Scenario: Counting canceled vs active.

SELECT DATE_TRUNC('month', cancel_date) AS month,
 COUNT(sub_id) AS churned_users
FROM Subscriptions
WHERE cancel_date IS NOT NULL
GROUP BY DATE_TRUNC('month', cancel_date);
