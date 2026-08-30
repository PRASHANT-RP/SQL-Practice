-- Q1) 7-day moving average
-- Scenario: Window function using ROWS BETWEEN 6 PRECEDING AND CURRENT ROW

SELECT 
    txn_date, 
    total_amount,
    AVG(total_amount) OVER (
        ORDER BY txn_date 
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS moving_avg_7_days
FROM DailyTransactions;

