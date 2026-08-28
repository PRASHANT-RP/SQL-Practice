-- Q1) 3 consecutive available seats
-- Scenario: Multi-lead window function with CTE

WITH SeatStatus AS (
    SELECT 
        seat_id, 
        is_free,
        LEAD(is_free, 1) OVER (ORDER BY seat_id) AS next_free,
        LEAD(is_free, 2) OVER (ORDER BY seat_id) AS next_next_free
    FROM Cinema
)
SELECT seat_id
FROM SeatStatus
WHERE is_free = true 
  AND next_free = true 
  AND next_next_free = true;


-- Q2) 3 or more consecutive days login
-- Scenario: Gaps and Islands problem using ROW_NUMBER()

WITH DiscreteDates AS (
    SELECT 
        user_id, 
        login_date,
        login_date - (ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY login_date)) * INTERVAL '1 day' AS grp
    FROM UserLogins
)
SELECT 
    user_id, 
    MIN(login_date), 
    MAX(login_date), 
    COUNT(*) AS consecutive_days
FROM DiscreteDates
GROUP BY user_id, grp
HAVING COUNT(*) >= 3;
