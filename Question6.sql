-- How many transactions occurred in each month of the year, and what was the total revenue generated in each of those months? (Tests: Date extraction/formatting, COUNT(), GROUP BY)



USE sales;

SELECT 
    MONTH(Date) AS transaction_month,
    COUNT(`Transaction ID`) AS total_transactions,
    SUM(`Total Amount`) AS total_revenue
FROM retail_sales_dataset
GROUP BY transaction_month
ORDER BY transaction_month;