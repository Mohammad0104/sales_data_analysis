-- Which Loyalty Tier spent the most money on 'Electronics' products? 
-- Write a query to find the total revenue (sum of Total Amount) spent on 'Electronics' per Loyalty Tier, ordered from highest to lowest revenue.

WITH CTE_SALES AS 
(SELECT 
    retail_sales_dataset_2.`Loyalty Tier`,
    SUM(retail_sales_dataset.`Total Amount`) AS most_spend
FROM sales.retail_sales_dataset
INNER JOIN sales2.retail_sales_dataset_2
    ON retail_sales_dataset.`Customer ID` = retail_sales_dataset_2.`Customer ID`
WHERE retail_sales_dataset.`Product Category` = 'Electronics'
GROUP BY retail_sales_dataset_2.`Loyalty Tier`
ORDER BY most_spend DESC)

SELECT `Loyalty Tier` ,most_spend
FROM CTE_SALES


	
