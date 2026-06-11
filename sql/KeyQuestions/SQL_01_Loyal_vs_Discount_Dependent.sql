use customer_analytics;

-- Who are the genuinely loyal customers vs. those who only buy when there is a discount?

SELECT
    `Loyalty Level V2`,
    `Promo Dependency Level`,
    COUNT(*) AS customer_count,
    ROUND(AVG(`Purchase Amount (USD)`),2) AS avg_spend,
    ROUND(AVG(`Customer Value Score`),2) AS avg_value_score
FROM customers
GROUP BY
    `Loyalty Level V2`,
    `Promo Dependency Level`
ORDER BY avg_value_score DESC;

/*
•High Loyalty + Low Promo Dependency = Genuine Loyal Customers : 745 Customers , 61.11 Avg Spend , 2265.81 Avg Value Score
 
Low Loyalty + High Promo Dependency = Discount-Driven Customers : 504 Customers , 59.21 Avg Spend , 831.36 Avg Value Score
*/

