-- Q1) Acceptance Rate of Requests
-- Scenario: COUNT(accepted) / COUNT(sent).

SELECT ROUND(
 COUNT(DISTINCT CASE WHEN action = 'accepted' THEN CONCAT(sender_id, '-', 
receiver_id) END)::DECIMAL /
 NULLIF(COUNT(DISTINCT CASE WHEN action = 'requested' THEN CONCAT(sender_id, 
'-', receiver_id) END), 0), 2
) AS acceptance_rate
FROM FriendRequests;
