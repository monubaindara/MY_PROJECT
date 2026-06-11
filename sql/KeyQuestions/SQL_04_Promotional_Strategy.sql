use customer_analytics;

-- How should the brand restructure its promotional strategy to protect margins without losing volume?

#Promo Dependency Analysis
SELECT
    `Promo Dependency Level`,
    COUNT(*) AS customer_count,
    ROUND(AVG(`Purchase Amount (USD)`),2) AS avg_spend,
    ROUND(AVG(`Customer Value Score`),2) AS avg_value_score,
    ROUND(AVG(`Loyalty Score V2`),2) AS avg_loyalty
FROM customers
GROUP BY `Promo Dependency Level`;

#Discount Analysis
SELECT
    `Discount Applied`,
    COUNT(*) AS customer_count,
    ROUND(AVG(`Customer Value Score`),2) AS avg_value_score,
    ROUND(AVG(`Loyalty Score V2`),2) AS avg_loyalty_score
FROM customers
GROUP BY `Discount Applied`;

#Promo Code Analysis
SELECT
    `Promo Code Used`,
    COUNT(*) AS customer_count,
    ROUND(AVG(`Customer Value Score`),2) AS avg_value_score,
    ROUND(AVG(`Purchase Amount (USD)`),2) AS avg_spend
FROM customers
GROUP BY `Promo Code Used`;

/*
Customers who received discounts generated a slightly higher average customer value score (1526.87) than
those who did not receive discounts (1511.09). However, their average loyalty score was lower (0.40 vs. 0.50). 
This suggests that while discounts may encourage purchases in the short term, 
they are less effective at building long-term customer loyalty.
 
Rather than offering discounts broadly, the brand should implement targeted promotions for low-loyalty or medium-risk
customers while rewarding highly loyal customers through exclusive benefits, memberships, or personalized offers.
This approach can improve margins without significantly impacting customer value.
*/