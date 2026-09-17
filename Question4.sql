-- What is the total revenue  and total Quantity sold for each Product Category?

USE sales;
SELECT 
    `Product Category`, sum(Quantity) AS total_quantity,
    SUM(`Total Amount`) AS total_revenue

FROM retail_sales_dataset
group by  `Product Category`;