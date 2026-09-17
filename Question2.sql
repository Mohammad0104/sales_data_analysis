-- Question 1: Retrieve all transactions made by 'Female' customers in the 'Electronics' category where the Total Amount is strictly greater than 100. 

USE sales;
SELECT `Transaction ID` , Gender, `Product Category` , `Total Amount`
FROM retail_sales_dataset
where Gender = 'Female' 
AND `Product Category`= 'Electronics' 
AND 'Total Amount' <100
Order By `Total Amount` DESC 

limit 5;

