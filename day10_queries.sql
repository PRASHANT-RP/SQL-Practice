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

