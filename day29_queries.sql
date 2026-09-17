-- Q1) Time difference between consecutive logins
-- Scenario: LAG timestamp subtraction.


SELECT user_id, login_time,
 login_time - LAG(login_time) OVER (PARTITION BY user_id ORDER BY login_time) 
AS time_diff
FROM UserLogins;
