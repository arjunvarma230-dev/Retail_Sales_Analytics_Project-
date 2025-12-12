-- ============================================
-- DATABASE SETUP
-- ============================================
CREATE DATABASE IF NOT EXISTS project1;
USE project1;

-- Check tables
SHOW TABLES;

-- ============================================
-- VIEW TABLE DATA 
-- ============================================
SELECT * FROM customer;
SELECT * FROM orders;
SELECT * FROM products;

-- ============================================
-- PRIMARY KEYS & FOREIGN KEYS
-- ============================================

-- Set primary key for customer
ALTER TABLE customer 
ADD PRIMARY KEY (CustomerID);

-- Set primary key for products
ALTER TABLE products 
ADD PRIMARY KEY (Product_ID);

-- Set primary key for orders
ALTER TABLE orders 
ADD PRIMARY KEY (Order_ID);

-- Foreign key: orders → customer
ALTER TABLE orders
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY (Customer_ID) REFERENCES customer(CustomerID);

-- Foreign key: orders → products
ALTER TABLE orders
ADD CONSTRAINT fk_orders_products
FOREIGN KEY (Product_ID) REFERENCES products(Product_ID);

-- ============================================
-- 1. Total Revenue
-- ============================================
SELECT 
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM
    orders;

-- ============================================
-- 2. Total Profit
-- ============================================
SELECT 
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM
    orders;

-- ============================================
-- 3. Total Orders
-- ============================================
SELECT 
    COUNT(*) AS Total_Orders
FROM
    orders;

-- ============================================
-- 4. Total Revenue by Region
-- ============================================
SELECT 
    c.Region, ROUND(SUM(o.Revenue), 2) AS Total_Revenue
FROM
    orders o
        JOIN
    customer c ON o.Customer_ID = c.CustomerID
GROUP BY c.Region
ORDER BY Total_Revenue DESC;

-- ============================================
-- 5. Revenue by Product Category
-- ============================================
SELECT 
    p.Category AS Product_Category,
    ROUND(SUM(o.Revenue), 2) AS Total_Revenue
FROM
    orders o
        JOIN
    products p ON o.Product_ID = p.Product_ID
GROUP BY p.Category
ORDER BY Total_Revenue DESC;

-- ============================================
-- 6. Profit Category Breakdown
-- ============================================
SELECT 
    o.Profit_Category,
    COUNT(o.Order_ID) AS Orders_Count,
    ROUND(SUM(o.Revenue), 2) AS Total_Revenue
FROM
    orders o
GROUP BY o.Profit_Category
ORDER BY Total_Revenue DESC;

-- ============================================
-- 7. Monthly Revenue (Time Series)
-- ============================================
SELECT 
    DATE_FORMAT(Order_Date, '%Y-%m') AS Month,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM
    orders
GROUP BY Month
ORDER BY Month;

-- ============================================
-- 8. Monthly Revenue with Month Number
-- ============================================
SELECT 
    MONTH(Order_Date) AS MonthNo,
    MONTHNAME(Order_Date) AS MonthName,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM
    orders
GROUP BY MonthNo , MonthName
ORDER BY MonthNo;

-- ============================================
-- 9. Hourly Revenue
-- ============================================
SELECT 
    HOUR(Order_Date) AS Order_Hour,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    COUNT(*) AS Orders_Count
FROM
    orders
GROUP BY Order_Hour
ORDER BY Order_Hour;

-- ============================================
-- 10. Top 10 Customers by Revenue
-- ============================================
SELECT 
    c.CustomerNameNew AS Customer_Name,
    ROUND(SUM(o.Revenue), 2) AS Total_Revenue,
    COUNT(o.Order_ID) AS Orders_Count
FROM
    orders o
        JOIN
    customer c ON c.CustomerID = o.Customer_ID
GROUP BY c.CustomerNameNew
ORDER BY Total_Revenue DESC
LIMIT 10;

-- ============================================
-- 11. Top Regions by Profit
-- ============================================
SELECT 
    c.Region,
    ROUND(SUM(o.Profit), 2) AS Total_Profit,
    COUNT(o.Order_ID) AS Orders_Count
FROM
    orders o
        JOIN
    customer c ON c.CustomerID = o.Customer_ID
GROUP BY c.Region
ORDER BY Total_Profit DESC;

-- ============================================
-- 12. Products with Lowest Profit Margin
-- ============================================
SELECT 
    p.Product_Name,
    ROUND(SUM(o.Profit) / SUM(o.Revenue) * 100, 2) AS Profit_Margin_Percent,
    ROUND(SUM(o.Revenue), 2) AS Total_Revenue
FROM
    orders o
        JOIN
    products p ON o.Product_ID = p.Product_ID
GROUP BY p.Product_Name
ORDER BY Profit_Margin_Percent ASC
LIMIT 10;


-- ============================================ 
-- EXPORTING THE FILES AS CSV
-- ============================================ 
SELECT * FROM customer;

select * from orders;

select * from products;