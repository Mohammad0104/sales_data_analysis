# Retail Sales Data Analysis – SQL Project

## Project Overview

This project is a SQL-based analysis of retail sales data designed to explore customer purchasing behavior, demographic patterns, product category performance, and sales trends.

The analysis uses transactional and customer demographic data to answer practical business questions and demonstrate how SQL can be used to transform raw data into meaningful business insights.

The project focuses on data aggregation, filtering, joins, grouping, date analysis, conditional logic, and ranking techniques commonly used in data analyst and business analyst roles.

---

## Datasets

The analysis uses two primary datasets:

* `retail_sales_dataset.csv`
* `retail_sales_dataset_2.csv`

The datasets contain information such as:

* Customer ID
* Gender
* Age
* Loyalty Tier
* Product Category
* Quantity
* Total Amount
* Transaction Date

The datasets are combined where necessary using `Customer ID` to perform more detailed customer and sales analysis.

---

## Business Questions

The project answers the following business questions:

### 1. High-Value Demographic Purchases

Retrieve all transactions made by **Female customers** in the **Electronics** category where the **Total Amount is greater than 100**.
<img width="1386" height="602" alt="image" src="https://github.com/user-attachments/assets/db1b3d8e-0319-4365-94f8-b3e413ceaa2a" />


### 2. Senior Customer Spending Habits

For customers over the age of 40, calculate:

* Maximum transaction amount
* Minimum transaction amount
* Average transaction amount
<img width="998" height="451" alt="image" src="https://github.com/user-attachments/assets/f73ed140-bace-490a-a3ac-63eb644489d2" />

### 3. Product Category Performance

Calculate the following for each product category:

* Total revenue
* Total quantity sold
<img width="718" height="466" alt="image" src="https://github.com/user-attachments/assets/fa6c0d8e-202c-4939-bd68-cd484b6be539" />

### 4. Target Demographics

Calculate the average customer age for each product category to identify the demographic profile associated with different product categories.

<img width="1299" height="446" alt="image" src="https://github.com/user-attachments/assets/8484221d-61b7-41eb-8394-15b52f812286" />

### 5. Monthly Sales Trends

Analyze monthly performance by calculating:

* Number of transactions
* Total revenue
<img width="1369" height="612" alt="image" src="https://github.com/user-attachments/assets/14696a84-2099-496b-b79a-81f58575f5e2" />

### 6. Top 5 Customers

Identify the top 5 customers based on their total spending across all transactions.

<img width="1278" height="542" alt="image" src="https://github.com/user-attachments/assets/e4e5029d-71c2-44af-8ee8-b8a0d0ed76c0" />

### 7. Gender Analysis – Clothing

Determine which gender contributes the most to total sales within the **Clothing** category.

<img width="1349" height="491" alt="image" src="https://github.com/user-attachments/assets/91c70d78-4fc5-48ac-87e6-8046e65398af" />

### 8. Loyalty Tier Analysis – Electronics

Determine which loyalty tier generates the highest sales amount from **Electronics** products.

<img width="1096" height="630" alt="image" src="https://github.com/user-attachments/assets/9d5d3e4f-55fc-4179-917e-7e8bef1284f4" />

### 9. Electronics Revenue by Loyalty Tier

Calculate total Electronics revenue for each loyalty tier and order the results from highest to lowest revenue.
<img width="1265" height="436" alt="image" src="https://github.com/user-attachments/assets/678417e6-83c3-498a-a560-253bb83c8def" />

---

# SQL Queries

This section contains the complete SQL queries used to answer the business questions above.

## Query 1 – High-Value Female Electronics Transactions

```sql
-- Retrieve Female customers who purchased Electronics
-- with a transaction amount greater than 100

SELECT *
FROM sales.retail_sales_dataset AS sales
INNER JOIN sales.retail_sales_dataset_2 AS sales2
    ON sales.`Customer ID` = sales2.`Customer ID`
WHERE sales2.Gender = 'Female'
  AND sales.`Product Category` = 'Electronics'
  AND sales.`Total Amount` > 100;
```

## Query 2 – Spending Analysis for Customers Over 40

```sql
-- Calculate maximum, minimum, and average transaction amount
-- for customers over the age of 40

SELECT
    MAX(`Total Amount`) AS max_spending,
    MIN(`Total Amount`) AS min_spending,
    AVG(`Total Amount`) AS avg_spending
FROM sales.retail_sales_dataset
WHERE Age > 40;
```

## Query 3 – Revenue and Quantity by Product Category

```sql
-- Calculate total revenue and quantity sold
-- for each product category

SELECT
    `Product Category`,
    SUM(`Total Amount`) AS total_revenue,
    SUM(Quantity) AS total_quantity
FROM sales.retail_sales_dataset
GROUP BY `Product Category`
ORDER BY total_revenue DESC;
```

## Query 4 – Average Age by Product Category

```sql
-- Calculate the average customer age
-- for each product category

SELECT
    `Product Category`,
    AVG(Age) AS average_age
FROM sales.retail_sales_dataset
GROUP BY `Product Category`
ORDER BY average_age;
```

## Query 5 – Monthly Sales Trends

```sql
-- Calculate the number of transactions
-- and total revenue for each month

SELECT
    MONTH(`Transaction Date`) AS transaction_month,
    COUNT(*) AS total_transactions,
    SUM(`Total Amount`) AS total_revenue
FROM sales.retail_sales_dataset
GROUP BY MONTH(`Transaction Date`)
ORDER BY transaction_month;
```

## Query 6 – Top 5 Customers by Total Spending

```sql
-- Identify the top 5 customers based on
-- their total spending

SELECT
    `Customer ID`,
    SUM(`Total Amount`) AS total_spending
FROM sales.retail_sales_dataset
GROUP BY `Customer ID`
ORDER BY total_spending DESC
LIMIT 5;
```

## Query 7 – Gender with Highest Clothing Sales

```sql
-- Determine which gender contributes the most
-- to Clothing sales

SELECT
    sales2.Gender,
    SUM(sales.`Total Amount`) AS total_sales
FROM sales.retail_sales_dataset AS sales
INNER JOIN sales.retail_sales_dataset_2 AS sales2
    ON sales.`Customer ID` = sales2.`Customer ID`
WHERE sales.`Product Category` = 'Clothing'
GROUP BY sales2.Gender
ORDER BY total_sales DESC;
```

## Query 8 – Loyalty Tier with Highest Electronics Sales

```sql
-- Determine which loyalty tier generates
-- the highest Electronics sales

SELECT
    sales2.`Loyalty Tier`,
    SUM(sales.`Total Amount`) AS total_sales
FROM sales.retail_sales_dataset AS sales
INNER JOIN sales.retail_sales_dataset_2 AS sales2
    ON sales.`Customer ID` = sales2.`Customer ID`
WHERE sales.`Product Category` = 'Electronics'
GROUP BY sales2.`Loyalty Tier`
ORDER BY total_sales DESC
LIMIT 1;
```

## Query 9 – Electronics Revenue by Loyalty Tier

```sql
-- Calculate Electronics revenue for each
-- loyalty tier and rank from highest to lowest

SELECT
    sales2.`Loyalty Tier`,
    SUM(sales.`Total Amount`) AS total_revenue
FROM sales.retail_sales_dataset AS sales
INNER JOIN sales.retail_sales_dataset_2 AS sales2
    ON sales.`Customer ID` = sales2.`Customer ID`
WHERE sales.`Product Category` = 'Electronics'
GROUP BY sales2.`Loyalty Tier`
ORDER BY total_revenue DESC;
```

---

# Additional SQL Analysis

The project also includes additional SQL techniques for customer segmentation and data transformation.

## Customer Age Categorization

Customers were grouped into age categories using a `CASE` statement:

```sql
SELECT 
    `Customer ID`,
    Gender,
    Age,
    CASE
        WHEN Age > 35 THEN 'OLD'
        WHEN Age < 25 THEN 'YOUNG'
        ELSE 'TEEN'
    END AS age_category
FROM sales.retail_sales_dataset
ORDER BY Age;
```

This demonstrates the use of conditional logic to create new analytical categories from existing data.

---

# SQL Concepts Demonstrated

This project demonstrates practical use of:

* `SELECT`
* `WHERE`
* `INNER JOIN`
* `GROUP BY`
* `HAVING`
* `ORDER BY`
* `LIMIT`
* `CASE`
* `SUM()`
* `AVG()`
* `COUNT()`
* `MAX()`
* `MIN()`
* Date functions
* Aggregate functions
* Customer segmentation
* Ranking and top-N analysis
* Revenue analysis
* Transaction analysis
* Demographic analysis

---

# Project Workflow

The analysis follows a simple data analysis workflow:

**Raw Data → Data Preparation → SQL Queries → Aggregation & Analysis → Business Insights**

1. Load the retail datasets into a SQL database.
2. Examine the available customer and transaction fields.
3. Join datasets where additional customer information is required.
4. Filter and aggregate the data based on business questions.
5. Analyze customer, demographic, product, and sales patterns.
6. Organize the results into meaningful business insights.

---

# Getting Started

To run this project locally:

### 1. Clone the repository

```bash
git clone <your-repository-url>
```

### 2. Import the datasets

Import the following CSV files into your preferred SQL environment:

```text
retail_sales_dataset.csv
retail_sales_dataset_2.csv
```

### 3. Create the required tables

Ensure the table names match the SQL queries, such as:

```text
sales.retail_sales_dataset
sales.retail_sales_dataset_2
```

### 4. Run the SQL scripts

Open the `.sql` files in your SQL environment and execute the queries to reproduce the analysis.

---

# Tools & Technologies

* **SQL**
* **MySQL**
* **CSV**
* **Git & GitHub**

---

# Key Skills Demonstrated

This project demonstrates practical SQL skills relevant to data analysis, including:

* Data querying and filtering
* Relational database joins
* Data aggregation
* Customer analysis
* Sales and revenue analysis
* Demographic analysis
* Time-based analysis
* Business question translation
* Data segmentation
* Top-N analysis
* Writing structured and readable SQL queries

---

## Project Purpose

The purpose of this project is to demonstrate how SQL can be used to analyze retail transaction data and answer real-world business questions.

It is part of my data analytics portfolio and demonstrates my ability to work with relational data, write SQL queries, perform analysis, and communicate results in a structured way.
