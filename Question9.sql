-- 2. Top Cities for Beauty Products (Intermediate)

 
SELECT 
    retail_sales_dataset_2.`City`,
    SUM(retail_sales_dataset.`Quantity`) AS total_sell
FROM sales.retail_sales_dataset
INNER JOIN sales2.retail_sales_dataset_2 
    ON retail_sales_dataset.`Customer ID` = retail_sales_dataset_2.`Customer ID`
WHERE retail_sales_dataset.`Product Category` = 'Beauty'
GROUP BY 
    retail_sales_dataset_2.`City`
ORDER BY total_sell DESC;
