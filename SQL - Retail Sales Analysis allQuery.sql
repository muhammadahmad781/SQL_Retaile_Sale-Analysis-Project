-- SQL Retail Sales Analysis - P1
CREATE DATABASE practice;
-- Create TABLE
CREATE TABLE practice
            (
            
                transaction_id INT PRIMARY KEY,	
                sale_date DATE,	 
                sale_time TIME,	
                customer_id	INT,
                gender	VARCHAR(15),
                age	INT,
                category VARCHAR(15),	
                quantity	INT,
                price_per_unit FLOAT,	
                cogs	FLOAT,
                total_sale FLOAT
            );
-- How to fetch all data with limit 10
SELECT * FROM practice LIMIT 10
-- How to find how much are available in given table
SELECT COUNT(*)  FROM practice
-- How to Search data whether the trascition id has no values.
SELECT * FROM practice WHERE transactions_id IS NULL
-- How to Search data whether the sale date has no values.
SELECT * FROM practice WHERE sale_date IS NULL
-- How to Search data whether the sale time has no values.
SELECT * FROM practice WHERE sale_time IS NULL
-- How to Search all record using one querry that haas no any value 
SElEct * from practice WHERE  transaction_id IS NULL OR sale_date IS NULL OR sale_time IS NULL OR gender IS NULL OR category IS NULL OR quantity IS NULL OR cogs IS NULL OR total_sale IS NULL;
-- How to delete all record using one querry that haas no any value
DELETE FROM practice WHERE transaction_id IS NULL OR sale_date IS NULL OR sale_time IS NULL OR gender IS NULL OR category IS NULL OR quantity IS NULL OR cogs IS NULL OR total_sale IS NULL;
-- Data Exploration
-- How many sales in the pracice?
SELECT COUNT(*) as total_sale FROM practice
-- How many uniuque customers from the custmoer ?
SELECT COUNT(DISTINCT customer_id) as total_sale FROM practice
SELECT DISTINCT category FROM retail_sales
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
select * from practice where sale_date = "2022-11-05"
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 and Gender Male
SELECT * FROM practice WHERE category = 'Clothing' AND quantiy >=4 and gender ="Male" order by transactions_id asc
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
select category, sum(total_sale) as Total_SAle from practice group by category
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select category, avg(age) as Averge_Age_ofCustomer from practice where category ="Beauty"
-- Q.4.1 Write a SQL query to find the average age of customers who purchased items from the all category.
select category, avg(age) as Averge_Age_ofCustomer from practice group by category
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select transactions_id,  sum(total_sale)as Total_sale from practice group by total_sale,transactions_id
having sum(total_sale)>1000
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category and order by gneder ascending .
select sum(transactions_id)as Total_Number_Of_Transactions,gender as Gender,category as Category from practice group by gender,category order by gender asc
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year.
SELECT YEAR(sale_date) AS sale_year,MONTH(sale_date) AS sale_month,AVG(total_sale) AS avg_monthly_sale FROM practice GROUP BY YEAR(sale_date), MONTH(sale_date) ORDER BY sale_year, sale_month;
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales
select customer_id as Customer_Number,sum(total_sale)as Total_Sale  from practice group by 1 ORDER BY 2 desc  limit 5
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
SELECT category,COUNT(DISTINCT customer_id) AS unique_customers FROM practice GROUP BY category;
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
SELECT CASE WHEN HOUR(sale_time) < 12 THEN 'Morning' WHEN HOUR(sale_time) BETWEEN 12 AND 16 THEN 'Afternoon' ELSE 'Evening' END AS Shift, COUNT(*) AS Number_of_orders
FROM practice
GROUP BY shift
ORDER BY 
    CASE shift
        WHEN 'Morning' THEN 1
        WHEN 'Afternoon' THEN 2
        WHEN 'Evening' THEN 3
    END;
