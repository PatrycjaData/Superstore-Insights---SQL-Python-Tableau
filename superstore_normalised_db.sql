USE superstore_db;

CREATE TABLE shipping AS
SELECT ROW_NUMBER() OVER() AS shipping_id,
x.ship_mode
FROM (
SELECT DISTINCT ship_mode
FROM superstore_clean
) x;

CREATE TABLE segment AS
SELECT ROW_NUMBER() OVER() AS segment_id,
x.segment
FROM (
SELECT DISTINCT segment
FROM superstore_clean
) x;

CREATE TABLE location AS
SELECT ROW_NUMBER() OVER() AS location_id,
    x.country,
    x.city,
    x.state,
    x.postal_code,
    x.region
FROM (
SELECT DISTINCT 
	country,
    city,
    state,
    postal_code,
    region
FROM superstore_clean
) x;

CREATE TABLE product AS
SELECT ROW_NUMBER() OVER() AS product_id,
	x.category,
    x.sub_category
FROM (
SELECT DISTINCT
	category,
    sub_category
FROM superstore_clean
) x;

CREATE TABLE sales (
    sale_id INT  AUTO_INCREMENT PRIMARY KEY,
    shipping_id INT,
    segment_id INT,
    location_id INT,
    product_id INT,
    sales DECIMAL(10,4),
    quantity INT,
    discount DECIMAL(3,2),
    profit DECIMAL(10,3)
);

INSERT INTO sales (
    shipping_id,
    segment_id,
    location_id,
    product_id,
    sales,
    quantity,
    discount,
    profit
)
SELECT
    sh.shipping_id,
    se.segment_id,
    lo.location_id,
    pr.product_id,
    s.Sales,
    s.Quantity,
    s.Discount,
    s.Profit
FROM superstore_clean s
JOIN shipping sh
    ON s.Ship_Mode = sh.ship_mode
JOIN segment se
    ON s.Segment = se.segment
JOIN location lo
    ON s.Country = lo.country
    AND s.City = lo.city
    AND s.State = lo.state
    AND s.Postal_Code = lo.postal_code
    AND s.Region = lo.region
JOIN product pr
    ON s.Category = pr.category
    AND s.Sub_Category = pr.sub_category;

ALTER TABLE shipping
MODIFY COLUMN shipping_id INT;

ALTER TABLE segment
MODIFY COLUMN segment_id INT;

ALTER TABLE location
MODIFY COLUMN location_id INT;

ALTER TABLE product
MODIFY COLUMN product_id INT;

ALTER TABLE shipping
ADD PRIMARY KEY (shipping_id);

ALTER TABLE segment
ADD PRIMARY KEY (segment_id);

ALTER TABLE location
ADD PRIMARY KEY (location_id);

ALTER TABLE product
ADD PRIMARY KEY (product_id);

ALTER TABLE sales
ADD CONSTRAINT shipping_id_fk
FOREIGN KEY (shipping_id)
REFERENCES shipping(shipping_id);

ALTER TABLE sales
ADD CONSTRAINT segment_id_fk
FOREIGN KEY (segment_id)
REFERENCES segment(segment_id);

ALTER TABLE sales
ADD CONSTRAINT location_id_fk
FOREIGN KEY (location_id)
REFERENCES location(location_id);

ALTER TABLE sales
ADD CONSTRAINT product_id_fk
FOREIGN KEY (product_id)
REFERENCES product(product_id);

ALTER TABLE sales
MODIFY shipping_id INT NOT NULL,
MODIFY segment_id INT NOT NULL,
MODIFY location_id INT NOT NULL,
MODIFY product_id INT NOT NULL;