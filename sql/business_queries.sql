-- ============================================
-- Retail Analytics: Business SQL Queries
-- Database: retail_analytics (MySQL 8.0)
-- Table: sales (391,283 rows)
-- ============================================

USE retail_analytics;

-- ============================================
-- Q1: Total Revenue Across All Sales
-- ============================================
SELECT 
    ROUND(SUM(Total_Revenue), 2) AS Total_Revenue
FROM sales;
-- Expected: ~£8,745,000


-- ============================================
-- Q2: Revenue by Country (Top 10)
-- ============================================
SELECT 
    Country,
    ROUND(SUM(Total_Revenue), 2) AS Total_Revenue,
    COUNT(DISTINCT CustomerID) AS Unique_Customers
FROM sales
GROUP BY Country
ORDER BY Total_Revenue DESC
LIMIT 10;


-- ============================================
-- Q3: Monthly Sales Trend
-- ============================================
SELECT 
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS Month,
    ROUND(SUM(Total_Revenue), 2) AS Monthly_Revenue,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM sales
GROUP BY DATE_FORMAT(InvoiceDate, '%Y-%m')
ORDER BY Month;


-- ============================================
-- Q4: Top 10 Best-Selling Products by Quantity
-- ============================================
SELECT 
    Description,
    SUM(Quantity) AS Total_Quantity,
    ROUND(SUM(Total_Revenue), 2) AS Total_Revenue
FROM sales
GROUP BY Description
ORDER BY Total_Quantity DESC
LIMIT 10;


-- ============================================
-- Q5: Top 10 Customers by Revenue
-- ============================================
SELECT 
    CustomerID,
    Country,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders,
    ROUND(SUM(Total_Revenue), 2) AS Total_Spent
FROM sales
GROUP BY CustomerID, Country
ORDER BY Total_Spent DESC
LIMIT 10;


-- ============================================
-- Q6: Average Order Value (AOV)
-- ============================================
SELECT 
    ROUND(SUM(Total_Revenue) / COUNT(DISTINCT InvoiceNo), 2) AS Average_Order_Value
FROM sales;
-- Expected: ~£500


-- ============================================
-- Q7: Customer Lifetime Value (CLV) Summary
-- ============================================
SELECT 
    ROUND(AVG(Customer_Total), 2) AS Avg_Customer_Lifetime_Value,
    ROUND(MAX(Customer_Total), 2) AS Max_Customer_Value,
    ROUND(MIN(Customer_Total), 2) AS Min_Customer_Value
FROM (
    SELECT 
        CustomerID,
        SUM(Total_Revenue) AS Customer_Total
    FROM sales
    GROUP BY CustomerID
) AS customer_totals;


-- ============================================
-- Q8: Repeat vs One-Time Customers
-- ============================================
SELECT 
    CASE 
        WHEN order_count = 1 THEN 'One-Time Buyer'
        WHEN order_count BETWEEN 2 AND 5 THEN 'Occasional (2-5 orders)'
        ELSE 'Loyal (6+ orders)'
    END AS Customer_Segment,
    COUNT(*) AS Number_of_Customers
FROM (
    SELECT 
        CustomerID,
        COUNT(DISTINCT InvoiceNo) AS order_count
    FROM sales
    GROUP BY CustomerID
) AS customer_orders
GROUP BY Customer_Segment
ORDER BY Number_of_Customers DESC;


-- ============================================
-- Q9: Monthly Running Total (Window Function)
-- ============================================
SELECT 
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS Month,
    ROUND(SUM(Total_Revenue), 2) AS Monthly_Revenue,
    ROUND(SUM(SUM(Total_Revenue)) OVER (ORDER BY DATE_FORMAT(InvoiceDate, '%Y-%m')), 2) AS Running_Total
FROM sales
GROUP BY DATE_FORMAT(InvoiceDate, '%Y-%m')
ORDER BY Month;


-- ============================================
-- Q10: Top Product in Each Country (Window Function)
-- ============================================
WITH country_product_rank AS (
    SELECT 
        Country,
        Description,
        ROUND(SUM(Total_Revenue), 2) AS Revenue,
        ROW_NUMBER() OVER (PARTITION BY Country ORDER BY SUM(Total_Revenue) DESC) AS rn
    FROM sales
    GROUP BY Country, Description
)
SELECT 
    Country,
    Description AS Top_Product,
    Revenue
FROM country_product_rank
WHERE rn = 1
ORDER BY Revenue DESC
LIMIT 15;