CREATE DATABASE StockMarket;
USE StockMarket;

CREATE TABLE stocks(
	id INT AUTO_INCREMENT PRIMARY KEY,
    ticker VARCHAR(10),
    sector VARCHAR(50),
    date DATE,
    close_price FLOAT
);

SELECT * FROM stocks LIMIT 20;


SELECT 
	ticker,
    date,
    COUNT(*) as occurrences
FROM stocks
GROUP BY ticker,date
HAVING COUNT(*) > 1;

CREATE VIEW DailyReturns AS
SELECT 
    ticker,
    sector,
    date,
    close_price,
    LAG(close_price) OVER (PARTITION BY ticker ORDER BY date) AS previous_price,
    (close_price - LAG(close_price) OVER (PARTITION BY ticker ORDER BY date)) / LAG(close_price) OVER (PARTITION BY ticker ORDER BY date) AS daily_return
FROM Stocks;

SET SQL_SAFE_UPDATES = 1;

WITH Duplicates AS (
    SELECT 
        date, 
        ticker, 
        close_price,
        ROW_NUMBER() OVER (
            PARTITION BY ticker, date, close_price 
            ORDER BY close_price DESC
        ) AS row_num
    FROM stocks
)
DELETE FROM stocks
WHERE (date, ticker, close_price) IN (
    SELECT date, ticker, close_price
    FROM Duplicates
    WHERE row_num > 1
);

SELECT 
    sector, 
    AVG(daily_return) AS average_return 
FROM DailyReturns 
GROUP BY sector
ORDER BY average_return DESC;

