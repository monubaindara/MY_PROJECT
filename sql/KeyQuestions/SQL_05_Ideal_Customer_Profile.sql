use customer_analytics;

-- What does the brand's ideal customer profile look like, and how can it acquire more of them?

#High-Value Customer Profile
SELECT
    Gender,
    Category,
    Location,
    `Loyalty Level V2`,

    COUNT(*) AS customer_count,

    ROUND(AVG(Age),0) AS avg_age,
    ROUND(AVG(`Customer Value Score`),2) AS avg_value_score,
    ROUND(AVG(`Purchase Amount (USD)`),2) AS avg_spend

FROM customers

WHERE `Customer Value Tier` = 'High Value'

GROUP BY
    Gender,
    Category,
    Location,
    `Loyalty Level V2`

ORDER BY avg_value_score DESC;

#Best Categories Among High-Value Customers
SELECT
    Category,
    COUNT(*) AS customers,
    ROUND(AVG(`Customer Value Score`),2) AS avg_value_score,
    ROUND(AVG(`Purchase Amount (USD)`),2) AS avg_spend

FROM customers

WHERE `Customer Value Tier` = 'High Value'

GROUP BY Category
ORDER BY avg_value_score DESC;

/*
Among high-value customers, Outerwear generates the highest average customer value score (3246.71), 
indicating that customers purchasing outerwear contribute the greatest long-term value. Clothing follows 
closely with a value score of 3125.17 and represents the largest high-value customer segment (444 customers).

The ideal customer is a highly loyal, low promo-dependent shopper with a high customer value score. 
These customers are more likely to be satisfied with their shopping experience, exhibit stronger repeat 
purchase behavior, and frequently purchase products in the Clothing and Outerwear categories. 
They generate the highest long-term value for the business and require fewer promotional incentives to remain engaged.
*/







