# 🛒 Retail Sales Data Analysis — SQL Project

> A MySQL portfolio project exploring customer spending, product category performance, demographic patterns, and monthly sales trends.

---

## 📌 Project Background

Understanding retail performance requires looking beyond total revenue. Customer demographics, product preferences, and loyalty tiers can provide additional context about purchasing patterns.

I built this project to practise answering business questions using SQL. I used two retail datasets and joined them through Customer ID where additional customer information was needed.

The analysis covers filtering, aggregation, joins, date functions, conditional logic, and top-N analysis.

---

## 🎯 Project Objectives

- Compare revenue and quantity sold across product categories.
- Analyse customer spending by age, gender, and loyalty tier.
- Identify customers with the highest total spending.
- Examine monthly revenue and transaction activity.
- Organise query results into clear answers to business questions.

---

## 📂 Datasets

The project uses two CSV files:

| File | Format | Purpose |
| --- | --- | --- |
| `retail_sales_dataset.csv` | CSV | Retail transaction and customer information |
| `retail_sales_dataset_2.csv` | CSV | Additional information used in customer analysis |

Fields used across the datasets include:

- Customer ID
- Gender
- Age
- Loyalty Tier
- Product Category
- Quantity
- Total Amount
- Transaction Date

The datasets are connected using **Customer ID**.

Before joining, the number of records per customer should be checked in both tables to ensure the join does not duplicate transactions or inflate revenue.

---

## 🗂️ Business Questions

| Analysis | Business Question | SQL Techniques |
| --- | --- | --- |
| Targeted transactions | Which transactions meet specific demographic, category, and spending criteria? | `SELECT`, `WHERE`, comparison operators |
| Spending patterns | What are the highest, lowest, and average transaction amounts for customers over 40? | `MAX`, `MIN`, `AVG`, `WHERE` |
| Category performance | How much revenue and quantity does each category generate? | `SUM`, `GROUP BY` |
| Customer demographics | What is the average customer age associated with each category? | `AVG`, `GROUP BY` |
| Monthly performance | How do revenue and transaction counts vary by month? | Date functions, `SUM`, `COUNT`, `GROUP BY` |
| Top customers | Which five customers have the highest total spending? | `SUM`, `GROUP BY`, `ORDER BY`, `LIMIT` |
| Gender comparison | Which gender contributes the most Clothing revenue? | Filtering, aggregation, grouping |
| Loyalty analysis | Which loyalty tier contributes the most Electronics revenue? | `INNER JOIN`, `SUM`, `GROUP BY` |
| Customer segmentation | How can customers be grouped into age bands? | `CASE` |

---

## 🔎 Analysis and Query Results

### 1. Targeted Electronics Purchases

Retrieve transactions made by female customers in the Electronics category where the transaction amount is greater than 100.

**Purpose:** Practise applying multiple conditions to identify a specific group of purchases.

<img width="1386" height="602" alt="SQL query filtering Electronics purchases by gender and transaction amount" src="https://github.com/user-attachments/assets/db1b3d8e-0319-4365-94f8-b3e413ceaa2a" />

---

### 2. Spending Patterns of Customers Over 40

Calculate the following for transactions made by customers over 40:

- Maximum transaction amount
- Minimum transaction amount
- Average transaction amount

**Purpose:** Compare the range and average value of purchases within this age group.

<img width="998" height="451" alt="SQL analysis of maximum, minimum, and average transaction amounts for customers over 40" src="https://github.com/user-attachments/assets/f73ed140-bace-490a-a3ac-63eb644489d2" />

---

### 3. Product Category Performance

Calculate total revenue and total quantity sold for each product category.

**Purpose:** Compare categories by both sales value and sales volume.

<img width="718" height="466" alt="SQL results showing total revenue and quantity sold by product category" src="https://github.com/user-attachments/assets/fa6c0d8e-202c-4939-bd68-cd484b6be539" />

---

### 4. Customer Age by Product Category

Calculate the average age associated with purchases in each product category.

**Purpose:** Explore demographic differences across product categories.

**Interpretation:** If the calculation uses transaction rows, customers with more transactions receive more weight. A customer-level average requires one record per customer within each category.

<img width="1299" height="446" alt="SQL results comparing average age across product categories" src="https://github.com/user-attachments/assets/8484221d-61b7-41eb-8394-15b52f812286" />

---

### 5. Monthly Sales Trends

Calculate monthly:

- Transaction counts
- Total revenue

**Purpose:** Identify differences in sales activity over time.

When the dataset contains multiple years, group by both year and month to keep the periods separate.

<img width="1369" height="612" alt="SQL query and results analysing monthly revenue and transaction counts" src="https://github.com/user-attachments/assets/14696a84-2099-496b-b79a-81f58575f5e2" />

---

### 6. Top Five Customers by Spending

Identify the five customers with the highest total spending across their transactions.

**Purpose:** Identify high-spending customers for further analysis.

This uses top-N analysis through `ORDER BY` and `LIMIT`.

<img width="1278" height="542" alt="SQL results identifying the top five customers by total spending" src="https://github.com/user-attachments/assets/e4e5029d-71c2-44af-8ee8-b8a0d0ed76c0" />

---

### 7. Clothing Sales by Gender

Compare total Clothing revenue across genders.

**Purpose:** Explore how sales contributions differ within a selected product category.

<img width="1349" height="491" alt="SQL analysis comparing Clothing revenue by gender" src="https://github.com/user-attachments/assets/91c70d78-4fc5-48ac-87e6-8046e65398af" />

---

### 8. Electronics Sales by Loyalty Tier

Join the relevant datasets and calculate Electronics revenue by loyalty tier.

**Purpose:** Compare the sales contribution of each loyalty group and identify the highest-contributing tier.

<img width="1096" height="630" alt="SQL query analysing Electronics sales by loyalty tier" src="https://github.com/user-attachments/assets/9d5d3e4f-55fc-4179-917e-7e8bef1284f4" />

The ordered comparison below presents each tier from highest to lowest revenue.

<img width="1265" height="436" alt="Electronics revenue by loyalty tier ordered from highest to lowest" src="https://github.com/user-attachments/assets/678417e6-83c3-498a-a560-253bb83c8def" />

---

## 👥 Customer Age Segmentation

A `CASE` statement can group customers into clearly defined age bands.

The revised example below uses labels that match the numerical ranges and handles missing ages separately.

```sql
SELECT
    `Customer ID`,
    Gender,
    Age,
    CASE
        WHEN Age IS NULL THEN 'Unknown'
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age <= 35 THEN '25–35'
        ELSE 'Over 35'
    END AS age_category
FROM sales.retail_sales_dataset
ORDER BY Age;
```

**Purpose:** Demonstrate how conditional logic can create categories for further comparison.

These age bands are analytical choices, not standard demographic definitions.

---

## 🔧 SQL Techniques

| Technique | Application |
| --- | --- |
| `SELECT` | Retrieve relevant fields |
| `WHERE` | Filter transactions and customer groups |
| `INNER JOIN` | Connect datasets using Customer ID |
| `GROUP BY` | Summarise results by category, customer, or period |
| `HAVING` | Filter grouped results |
| `ORDER BY` | Sort comparisons |
| `LIMIT` | Return a selected number of results |
| `CASE` | Create customer age bands |
| `SUM()` | Calculate revenue and quantity totals |
| `AVG()` | Calculate average transaction amounts and ages |
| `COUNT()` | Count records or transactions, depending on the data structure |
| `MAX()` and `MIN()` | Identify highest and lowest values |
| Date functions | Extract reporting periods |

---

## 🔄 Project Workflow

1. **Import the data**  
   Load the two CSV files into MySQL.

2. **Review the structure**  
   Examine customer identifiers, transaction fields, dates, and numerical columns.

3. **Connect the datasets**  
   Join the tables where additional customer information is required.

4. **Write business queries**  
   Apply filters, aggregations, grouping, and conditional logic.

5. **Compare the results**  
   Examine product categories, customer groups, and monthly performance.

6. **Document the analysis**  
   Present the questions, SQL techniques, and result screenshots.

---

## 💡 Business Relevance

The queries provide a foundation for investigating:

- **Product performance:** Which categories contribute the most revenue and quantity?
- **Customer value:** Which customers account for the highest spending?
- **Sales patterns:** Which months show stronger or weaker activity?
- **Demographic differences:** How do purchasing patterns vary across age and gender groups?
- **Loyalty contribution:** How much revenue comes from each loyalty tier?

Total revenue alone does not show profitability or customer value per person. Further analysis would require measures such as profit, customer counts, and average spending per customer.

---

## 🛠️ Tools and Technologies

- **MySQL:** database environment and query execution.
- **SQL:** filtering, joining, aggregation, and segmentation.
- **CSV:** source data format.
- **Git and GitHub:** project version control and documentation.

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/Mohammad0104/sales_data_analysis.git
cd sales_data_analysis
```

### 2. Import the Datasets

Import these files into MySQL:

- `retail_sales_dataset.csv`
- `retail_sales_dataset_2.csv`

### 3. Check Table Names and Data Types

Ensure database and table names match those used in the SQL scripts.

For example:

```text
sales.retail_sales_dataset
sales.retail_sales_dataset_2
```

Check that transaction amounts and quantities use suitable numerical types and that dates are correctly converted before running time-based analysis.

### 4. Execute the Queries

Open the SQL scripts in your MySQL client and run the queries to reproduce the analysis.

---

## 🔍 Validation and Future Improvements

- Check missing values and duplicate records before analysis.
- Validate join relationships to prevent inflated totals.
- Use distinct transaction identifiers when multiple rows can belong to one transaction.
- Group monthly results by year and month when analysing multiple years.
- Add written findings alongside screenshots, supported by the query results.
- Extend the project with subqueries, CTEs, and window functions such as `ROW_NUMBER`, `RANK`, and `DENSE_RANK`.
- Compare revenue per customer across loyalty tiers to account for differences in group size.

---

## 👤 Author

**Mohammad**  
B.Sc. in Computer Science, Data Science concentration — Ontario Tech University

[GitHub](https://github.com/Mohammad0104)

---

## 📌 Project Purpose

This project demonstrates my ability to join relational datasets, write SQL queries, compare business metrics, and present results in a structured format.

It forms part of my data analytics portfolio and supports my development in SQL-based business analysis.
