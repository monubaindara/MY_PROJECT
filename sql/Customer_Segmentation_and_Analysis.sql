use customer_analytics;

-- What separates high-value customers from low-value ones, and which profiles show the strongest repeat purchase behavior?
	#Compare High vs Low Value Customers
SELECT
    `Customer Value Tier`,
    COUNT(*) AS customers,
    ROUND(AVG(`Purchase Amount (USD)`),2) AS avg_spend,
    ROUND(AVG(`Previous Purchases`),2) AS avg_previous_purchases,
    ROUND(AVG(`Loyalty Score V2`),2) AS avg_loyalty_score,
    ROUND(AVG(`Promo Dependency Score`),2) AS avg_promo_dependency
FROM customers
GROUP BY `Customer Value Tier`
ORDER BY avg_spend DESC;

	#Strongest Repeat Purchase Profiles
SELECT
    Category,
    `Loyalty Level V2`,
    COUNT(*) AS customers,
    ROUND(AVG(`Previous Purchases`),2) AS avg_previous_purchases
FROM customers
GROUP BY
    Category,
    `Loyalty Level V2`
ORDER BY avg_previous_purchases DESC;

/*
The analysis reveals a clear distinction between high-value and low-value customers. High-value 
customers spend significantly more per transaction ($79.66 vs. $48.59), make substantially more repeat 
purchases (39.72 vs. 8.28), and exhibit the strongest loyalty scores (0.60 vs. 0.30). These findings 
suggest that customer value is primarily driven by repeat purchasing behavior and loyalty rather than promotional reliance.

The strongest repeat purchase behavior was observed among customers classified as High Loyalty across all categories:
| Category    | Avg Previous Purchases |
| ----------- | ---------------------- |
| Outerwear   | 39.12                  |
| Accessories | 38.33                  |
| Clothing    | 38.05                  |
| Footwear    | 37.11                  |

*/



-- Which seasons and categories are associated with lower-tenure customers versus those with high previous purchase counts?
SELECT
    Season,
    Category,
    COUNT(*) AS customers,
    ROUND(AVG(`Previous Purchases`),2) AS avg_previous_purchases,
    ROUND(AVG(`Customer Value Score`),2) AS avg_value_score
FROM customers
GROUP BY
    Season,
    Category
ORDER BY avg_previous_purchases DESC;

/*
Accessories during Summer and Footwear during Winter are associated with the highest repeat purchase 
behavior, suggesting strong customer retention. In contrast, Spring Footwear and Summer Outerwear attract customers 
with relatively lower purchase histories, indicating potential entry-point categories for acquiring new customers.
*/




-- Which geographies signal organic demand versus discount-driven volume?

SELECT
    Location,
    COUNT(*) AS customers,
    ROUND(AVG(`Customer Value Score`),2) AS avg_value_score,
    ROUND(AVG(`Promo Dependency Score`),2) AS avg_promo_dependency,
    ROUND(AVG(`Purchase Amount (USD)`),2) AS avg_spend
FROM customers
GROUP BY Location
ORDER BY avg_promo_dependency ASC;
/*
Arizona and Alaska emerge as the strongest organic-demand markets, generating high customer 
value and spending with minimal promotional dependence. Conversely, states such as Indiana, Iowa, 
and Oregon exhibit higher promotional reliance, suggesting that a portion of their demand may be 
discount-driven rather than driven by brand loyalty.
*/


