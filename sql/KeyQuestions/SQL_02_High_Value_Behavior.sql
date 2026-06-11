
use customer_analytics;

-- What behavioral patterns today predict high customer value over time?

#Frequency Analysis
SELECT
    `Frequency of Purchases`,
    COUNT(*) AS customers,
    ROUND(AVG(`Customer Value Score`),2) AS avg_value_score,
    ROUND(AVG(`Purchase Amount (USD)`),2) AS avg_spend,
    ROUND(AVG(`Previous Purchases`),2) AS avg_previous_purchases
FROM customers
GROUP BY `Frequency of Purchases`
ORDER BY avg_value_score DESC;

#Subscription Impact
SELECT
    `Subscription Status`,
    COUNT(*) AS customers,
    ROUND(AVG(`Customer Value Score`),2) AS avg_value_score,
    ROUND(AVG(`Loyalty Score V2`),2) AS avg_loyalty_score
FROM customers
GROUP BY `Subscription Status`;

#Satisfaction Impact
SELECT
    `Satisfaction Flag`,
    COUNT(*) AS customers,
    ROUND(AVG(`Customer Value Score`),2) AS avg_value_score
FROM customers
GROUP BY `Satisfaction Flag`;
/*
Analysis of customer behavior reveals that satisfaction, subscription membership, and purchase frequency are associated 
with higher customer value. Satisfied customers achieved an average value score of 1552.15 compared to 1493.16 for unsatisfied 
customers. Subscribers also showed slightly higher value scores (1551.81) than non-subscribers (1505.32). The strongest 
behavioral indicator was purchase frequency, where quarterly purchasers recorded the highest average customer value score (1622.99),
while annual purchasers had the lowest (1470.35). These findings suggest that increasing customer engagement and 
maintaining customer satisfaction are key drivers of long-term customer value and retention.
*/











