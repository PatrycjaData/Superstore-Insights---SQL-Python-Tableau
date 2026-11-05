-- Which sub-category is not profitable?

SELECT
    p.sub_category,
    SUM(s.profit) AS total_profit,
    ROW_NUMBER() OVER (
        ORDER BY SUM(s.profit) ASC
    ) AS row_num
FROM sales s
JOIN product p
    ON s.product_id = p.product_id
GROUP BY p.sub_category
HAVING SUM(s.profit) <= 0
ORDER BY total_profit ASC;


-- What is the average loss for unprofitable orders across each category?

SELECT
    p.category,
    AVG(s.profit) AS average_loss
FROM sales s
JOIN product p
    ON s.product_id = p.product_id
WHERE s.profit < 0
GROUP BY p.category
ORDER BY average_loss ASC;


-- Which categories have a negative total profit?

SELECT
    p.category,
    SUM(s.profit) AS total_profit
FROM sales s
JOIN product p
    ON s.product_id = p.product_id
GROUP BY category
HAVING SUM(s.profit) < 0
ORDER BY total_profit ASC;


-- What is the sales ranking of sub-categories within each category?

SELECT
    p.category,
    p.sub_category,
    SUM(s.sales) AS total_sales,
    ROW_NUMBER() OVER (
        PARTITION BY p.category
        ORDER BY SUM(s.sales) DESC
    ) AS row_num
FROM sales s
JOIN product p
    ON s.product_id = p.product_id
GROUP BY
    p.category,
    p.sub_category
ORDER BY
    p.category,
    total_sales DESC;


-- Which sub-category has the highest sales?
 
SELECT
    p.sub_category,
    SUM(s.sales) AS total_sales,
    ROW_NUMBER() OVER (
        ORDER BY SUM(s.sales) DESC
    ) AS row_num
FROM sales s
JOIN product p
    ON s.product_id = p.product_id
GROUP BY p.sub_category
ORDER BY total_sales DESC;


-- What is the top selling sub-category in each category

SELECT *
FROM (
    SELECT
        p.category,
        p.sub_category,
        SUM(s.sales) AS total_sales,
        ROW_NUMBER() OVER (
            PARTITION BY p.category
            ORDER BY SUM(s.sales) DESC
        ) AS row_num
    FROM sales s
    JOIN product p
        ON s.product_id = p.product_id
    GROUP BY
        p.category,
        p.sub_category
) result
WHERE row_num = 1;


-- Which customer segment is the most profitable?

SELECT
    se.segment,
    SUM(s.profit) AS total_profit
FROM sales s
INNER JOIN segment se
    ON s.segment_id = se.segment_id
GROUP BY se.segment
ORDER BY total_profit DESC
LIMIT 1;


-- Which is the preferred ship mode?

SELECT
    sh.ship_mode,
    COUNT(*) AS total_shipments
FROM sales s
INNER JOIN shipping sh
    ON s.shipping_id = sh.shipping_id
GROUP BY sh.ship_mode
ORDER BY total_shipments DESC
LIMIT 1;


-- Which region is the most profitable?

SELECT
    l.region,
    SUM(s.profit) AS total_profit
FROM location l
INNER JOIN sales s
    ON l.location_id = s.location_id
GROUP BY l.region
ORDER BY total_profit asc
LIMIT 1;
	

-- Which city has the highest sales?

SELECT
    l.city,
    SUM(s.sales) AS total_sales
FROM sales s
Inner Join location l
on l.location_id=s.location_id
Group BY l.city
Order BY total_sales DESC
Limit 1;