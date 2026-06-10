
-- Query 1: Revenue and profit by region
SELECT Region,
       ROUND(SUM(Sales), 2)         AS Total_Sales,
       ROUND(SUM(Profit), 2)        AS Total_Profit,
       ROUND(AVG(profit_margin), 2) AS Avg_Margin_Pct
FROM orders
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Query 2: Top 5 sub-categories by profit
SELECT [Sub-Category],
       ROUND(SUM(Sales), 2)  AS Total_Sales,
       ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders
GROUP BY [Sub-Category]
ORDER BY Total_Profit DESC
LIMIT 5;

-- Query 3: Monthly revenue trend
SELECT order_year, order_month,
       ROUND(SUM(Sales), 2) AS Monthly_Sales
FROM orders
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

-- Query 4: Discount impact on profit
SELECT CASE
           WHEN Discount = 0     THEN 'No Discount'
           WHEN Discount <= 0.10 THEN '1-10%'
           WHEN Discount <= 0.20 THEN '11-20%'
           WHEN Discount <= 0.30 THEN '21-30%'
           ELSE 'Above 30%'
       END AS Discount_Band,
       COUNT(*)             AS Orders,
       ROUND(SUM(Sales), 2) AS Total_Sales,
       ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders
GROUP BY Discount_Band
ORDER BY Total_Profit DESC;

-- Query 5: Top 10 states by profit
SELECT State,
       COUNT(DISTINCT [Customer ID]) AS Customers,
       ROUND(SUM(Sales), 2)          AS Total_Sales,
       ROUND(SUM(Profit), 2)         AS Total_Profit
FROM orders
GROUP BY State
ORDER BY Total_Profit DESC
LIMIT 10;
