-- ============================================================
-- TASK 2: EXPLORATORY DATA ANALYSIS & BUSINESS INTELLIGENCE
-- SQL QUERIES FILE FOR GITHUB DELIVERABLE
-- ============================================================

-- Database Setup
CREATE DATABASE IF NOT EXISTS sales_db;
USE sales_db;

-- ------------------------------------------------------------
-- Q1: Total Revenue and Order Count by Product Category
-- ------------------------------------------------------------
SELECT 
    Category,
    COUNT(Order_ID) AS Total_Orders,
    SUM(Total_Sales) AS Total_Revenue,
    AVG(Total_Sales) AS Avg_Order_Value
FROM sales_data
GROUP BY Category
ORDER BY Total_Revenue DESC;

-- ------------------------------------------------------------
-- Q2: Top 5 Products by Revenue
-- ------------------------------------------------------------
SELECT 
    Product,
    Category,
    SUM(Quantity) AS Total_Units_Sold,
    SUM(Total_Sales) AS Total_Revenue
FROM sales_data
GROUP BY Product, Category
ORDER BY Total_Revenue DESC
LIMIT 5;

-- ------------------------------------------------------------
-- Q3: Sales Performance by Region / City
-- ------------------------------------------------------------
SELECT 
    City,
    COUNT(Order_ID) AS Total_Orders,
    SUM(Total_Sales) AS Total_Revenue,
    AVG(Total_Sales) AS Avg_Order_Value
FROM sales_data
GROUP BY City
ORDER BY Total_Revenue DESC;

-- ------------------------------------------------------------
-- Q4: Monthly Sales & Revenue Trend
-- ------------------------------------------------------------
SELECT 
    DATE_FORMAT(Order_Date, '%Y-%m') AS Year_Month,
    COUNT(Order_ID) AS Total_Orders,
    SUM(Total_Sales) AS Monthly_Revenue
FROM sales_data
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY Year_Month ASC;

-- ------------------------------------------------------------
-- Q5: Sales Revenue by Payment Mode / Gender
-- ------------------------------------------------------------
SELECT 
    Gender,
    COUNT(Order_ID) AS Total_Orders,
    SUM(Total_Sales) AS Total_Revenue,
    AVG(Total_Sales) AS Avg_Order_Value
FROM sales_data
GROUP BY Gender;

-- ------------------------------------------------------------
-- Q6: Top 5 Customers by Spending
-- ------------------------------------------------------------
SELECT 
    Customer_Name,
    COUNT(Order_ID) AS Total_Orders,
    SUM(Total_Sales) AS Total_Revenue
FROM sales_data
GROUP BY Customer_Name
ORDER BY Total_Revenue DESC
LIMIT 5;
