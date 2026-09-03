-- Q1) Top 10% spender users
-- Scenario: Using NTILE window function

WITH UserBuckets AS (
    SELECT 
        user_id, 
        total_spend,
        NTILE(10) OVER (ORDER BY total_spend DESC) AS bucket
    FROM UserSpends
)
SELECT 
    user_id, 
    total_spend
FROM UserBuckets
WHERE bucket = 1;
