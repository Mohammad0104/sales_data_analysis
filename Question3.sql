-- Question 2: Find the maximum, minimum, and average Total Amount spent per transaction for customers who are over the age of 40.
USE sales;
SELECT
    MAX(`Total Amount`) AS max_spent,
    MIN(`Total Amount`) AS min_spent,
    AVG(`Total Amount`) AS avg_spent,
    (SELECT AVG(`Total Amount`)
     FROM retail_sales_dataset) AS overall_avg_spending
FROM retail_sales_dataset
WHERE Age > 40;