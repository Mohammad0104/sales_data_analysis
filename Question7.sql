-- Question 6: Identify the top 5 Customer IDs who have spent the most money overall across all their transactions. (Tests: GROUP BY, ORDER BY, LIMIT or TOP)


USE sales;

SELECT 
    `Customer ID`,
    SUM(`Total Amount`) AS total_spent
FROM retail_sales_dataset
GROUP BY `Customer ID`
ORDER BY total_spent DESC
LIMIT 5;