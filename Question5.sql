-- Question 4: Calculate the average customer Age for each Product Category to understand the target demographic for different types of items. (Tests: GROUP BY, AVG())



USE sales;
SELECT 
    `Product Category`, avg (AGE) AS avg_age

FROM retail_sales_dataset
group by  `Product Category`;