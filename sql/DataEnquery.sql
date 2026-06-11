USE customer_analytics;
SELECT COUNT(*) FROM customers;
DESCRIBE customers;


-- Customer Value Distribution
SELECT
    `Customer Value Tier`,
    COUNT(*) AS Customer_Count
FROM customers
GROUP BY `Customer Value Tier`
ORDER BY Customer_Count DESC;

-- Revenue by Customer Value Tier
SELECT
    `Customer Value Tier`,
    ROUND(AVG(`Purchase Amount (USD)`),2) AS Avg_Purchase,
    ROUND(SUM(`Purchase Amount (USD)`),2) AS Total_Revenue
FROM customers
GROUP BY `Customer Value Tier`
ORDER BY Total_Revenue DESC;

-- Loyalty Distribution (V2) 
SELECT
    `Loyalty Level V2`,
    COUNT(*) AS Customers
FROM customers
GROUP BY `Loyalty Level V2`
ORDER BY Customers DESC;

-- Satisfaction Analysis
SELECT
    `Satisfaction Flag`,
    COUNT(*) AS Customers
FROM customers
GROUP BY `Satisfaction Flag`;

-- Promo Dependency Analysis
SELECT
    `Promo Dependency Level`,
    COUNT(*) AS Customers
FROM customers
GROUP BY `Promo Dependency Level`;

#Revenue by Category
SELECT
    Category,
    SUM(`Purchase Amount (USD)`) AS Revenue
FROM customers
GROUP BY Category
ORDER BY Revenue DESC;

# Category vs Loyalty
SELECT
    Category,
    ROUND(AVG(`Loyalty Score V2`),2) AS Avg_Loyalty
FROM customers
GROUP BY Category
ORDER BY Avg_Loyalty DESC;

#Top 10 Revenue Locations
SELECT
    Location,
    SUM(`Purchase Amount (USD)`) AS Revenue
FROM customers
GROUP BY Location
ORDER BY Revenue DESC
LIMIT 10;

#Ideal Customers
/*These are customers who are:
High Value
High Loyalty
Low Promo Dependency 
*/
SELECT
    COUNT(*) AS Ideal_Customers
FROM customers
WHERE `Customer Value Tier` = 'High Value'
AND `Loyalty Level V2` = 'High Loyalty'
AND `Promo Dependency Level` = 'Low Dependency';

#Ideal Customer Profile
SELECT
    Gender,
    Category,
    ROUND(AVG(Age),0) AS Avg_Age,
    COUNT(*) AS Customers
FROM customers
WHERE `Customer Value Tier` = 'High Value'
AND `Loyalty Level V2` = 'High Loyalty'
GROUP BY Gender, Category
ORDER BY Customers DESC;

