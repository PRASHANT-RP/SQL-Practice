--Q1) Pages with zero likes
--Scenario: Anti-join logic.

SELECT page_id 
FROM Pages 
WHERE page_id NOT IN (SELECT page_id FROM PageLikes);
