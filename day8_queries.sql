-- Q1) Cumulative sum (Running total)
-- Scenario: Window SUM OVER (ORDER BY date)

SELECT 
    sale_date, 
    daily_amount,
    SUM(daily_amount) OVER (ORDER BY sale_date) AS running_total
FROM DailySales;

