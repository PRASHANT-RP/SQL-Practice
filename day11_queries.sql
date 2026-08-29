-- Q1) Swap adjacent IDs
-- Scenario: CASE WHEN with Modulo logic

SELECT 
    CASE 
        WHEN MOD(id, 2) <> 0 AND id = (SELECT MAX(id) FROM Seats) THEN id
        WHEN MOD(id, 2) <> 0 THEN id + 1
        ELSE id - 1
    END AS id, 
    student
FROM Seats
ORDER BY id;
