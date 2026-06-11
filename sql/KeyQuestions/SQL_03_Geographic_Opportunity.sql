use customer_analytics;

-- Which geographies and demographics are commercially underleveraged?
# Location Analysis
SELECT
    Location,
    COUNT(*) AS customer_count,
    ROUND(AVG(`Customer Value Score`),2) AS avg_value_score,
    ROUND(AVG(`Purchase Amount (USD)`),2) AS avg_spend,
    ROUND(SUM(`Purchase Amount (USD)`),2) AS total_revenue
FROM customers
GROUP BY Location
ORDER BY avg_value_score DESC;

#Gender Analysis
SELECT
    Gender,
    COUNT(*) AS customer_count,
    ROUND(AVG(`Customer Value Score`),2) AS avg_value_score,
    ROUND(AVG(`Purchase Amount (USD)`),2) AS avg_spend
FROM customers
GROUP BY Gender;

#Age Group Analysis
SELECT
    CASE
        WHEN Age < 25 THEN '18-24'
        WHEN Age < 35 THEN '25-34'
        WHEN Age < 45 THEN '35-44'
        WHEN Age < 55 THEN '45-54'
        ELSE '55+'
    END AS age_group,

    COUNT(*) AS customer_count,
    ROUND(AVG(`Customer Value Score`),2) AS avg_value_score,
    ROUND(AVG(`Purchase Amount (USD)`),2) AS avg_spend

FROM customers
GROUP BY age_group
ORDER BY avg_value_score DESC;

/*
Geographic analysis reveals that Arizona, Pennsylvania, and Alaska are commercially underleveraged markets,
combining high customer value scores with relatively small customer populations. These states represent attractive
expansion opportunities. Demographic analysis shows that male customers currently generate slightly higher value 
than female customers, while the 55+ age group is the highest-value segment overall. The brand should focus acquisition 
and retention initiatives on high-value states and older customer segments while developing targeted strategies to 
increase engagement among younger customers and female shoppers.
*/
