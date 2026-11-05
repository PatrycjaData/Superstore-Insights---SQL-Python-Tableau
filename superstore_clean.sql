CREATE DATABASE superstore_db;

USE superstore_db;

CREATE TABLE superstore (
    Ship_Mode VARCHAR(50),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Postal_Code VARCHAR(10),
    Region VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Sales DECIMAL(10,4),
    Quantity INT,
    Discount DECIMAL(3,2),
    Profit DECIMAL(10,3)
);
SELECT *
FROM superstore
LIMIT 10;

SELECT COUNT(*) AS total_rows
FROM superstore;

SELECT *
FROM superstore
WHERE ship_mode IS NULL
   OR segment IS NULL
   OR country IS NULL
   OR city IS NULL
   OR state IS NULL
   OR postal_code IS NULL
   OR region IS NULL
   OR category IS NULL
   OR sub_category IS NULL
   OR sales IS NULL
   OR quantity IS NULL
   OR discount IS NULL
   OR profit IS NULL;
   
SELECT 
    ship_mode, segment, country, city, state, postal_code,
    region, category, sub_category,
    sales, quantity, discount, profit,
    COUNT(*) AS duplicate_count
FROM superstore
GROUP BY 
    ship_mode, segment, country, city, state, postal_code,
    region, category, sub_category,
    sales, quantity, discount, profit
HAVING COUNT(*) > 1;

SELECT *
FROM superstore
WHERE ship_mode = 'Standard Class'
AND postal_code = 98105
AND sales = 19.4400
AND profit = 9.331
AND quantity = 3;

CREATE TABLE superstore_clean AS
SELECT DISTINCT *
FROM superstore;

SELECT COUNT(*) AS total_rows
FROM superstore_clean;