CREATE DATABASE ecommerce_dw;

use ecommerce_dw;

CREATE TABLE dim_customer(
	customer_id VARCHAR(50) PRIMARY KEY);
    
CREATE TABLE dim_product(
	product_id INT auto_increment PRIMARY KEY,
    product_category VARCHAR(100),
    UNIQUE(product_category)
);

CREATE TABLE dim_payment(
	payment_id INT auto_increment PRIMARY KEY,
    payment_method VARCHAR(50),
    UNIQUE(payment_method)
);

CREATE TABLE dim_date(
	date_id DATE PRIMARY KEY,
    year INT,
    month INT,
    month_name VARCHAR(50),
    quarter INT
);

CREATE TABLE fact_sales (
    order_id VARCHAR(50) PRIMARY KEY,
    order_date DATE,
    customer_id VARCHAR(50),
    product_id INT,
    region VARCHAR(50),
    quantity INT,
    unit_price DECIMAL(12,2),
    discount DECIMAL(5,2),
    payment_id INT,
    delivery_days INT,
    customer_rating DECIMAL(3,2),
    revenue DECIMAL(12,2),
    gross_sales DECIMAL(12,2),
    discount_amount DECIMAL(12,2),
    calculated_revenue DECIMAL(12,2),
    FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    FOREIGN KEY (payment_id) REFERENCES dim_payment(payment_id)
);

SELECT COUNT(*) FROM fact_sales;

SELECT * FROM dim_customer
LIMIT 10;

SELECT * FROM dim_payment
LIMIT 10;

SELECT * FROM dim_product
LIMIT 10;

SELECT * FROM fact_sales
LIMIT 10;

-- SQL analysis

-- Total revenue

SELECT SUM(revenue) AS TOTAL_REVINUE
FROM fact_sales;

-- Total orders

SELECT COUNT(DISTINCT order_id) AS TOTAL_ORDERS
FROM fact_sales;

-- Total customer

SELECT COUNT(DISTINCT customer_id) AS TOTAL_CUSTOMERS
FROM dim_customer;

-- Revenue by region

SELECT region AS REGION, SUM(revenue) AS TOTAL_REVENUE 
FROM fact_sales
group by REGION
ORDER BY TOTAL_REVENUE DESC;

-- Revenue by category

SELECT
    p.product_category,
    SUM(f.revenue) AS total_revenue
FROM fact_sales f
JOIN dim_product p
    ON f.product_id = p.product_id
GROUP BY p.product_category
ORDER BY total_revenue DESC;

-- Monthly revenue

SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(revenue) AS total_revenue
FROM fact_sales
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY year, month;

-- Payment method

SELECT p.payment_method,
SUM(f.revenue) AS TOTAL_REVENUE,
COUNT(*) AS TOTAL_ORDERS
FROM fact_sales f
JOIN dim_payment p ON f.payment_id = p.payment_id
GROUP BY p.payment_method
ORDER BY TOTAL_REVENUE DESC;

-- Average delivery time

SELECT avg(delivery_days) AS AVERAGE_DELIVERY_DAYS
FROM fact_sales;

-- Average customer rating

SELECT avg(customer_rating) AS AVERAGE_CUATOMER_RATING
FROM fact_sales;

-- Top 10 customers

SELECT customer_id AS TOP_TEN_CUSTOMERS,
sum(revenue) AS TOTAL_REVENUE
FROM fact_sales
group by TOP_TEN_CUSTOMERS
order by TOTAL_REVENUE desc
limit 10;

CREATE VIEW vw_sales_analysis AS
SELECT
    f.order_id,
    f.order_date,
    f.customer_id,
    p.product_category,
    f.region,
    f.quantity,
    f.unit_price,
    f.discount,
    pm.payment_method,
    f.delivery_days,
    f.customer_rating,
    f.revenue,
    f.gross_sales,
    f.discount_amount
FROM fact_sales f
JOIN dim_product p
    ON f.product_id = p.product_id
JOIN dim_payment pm
    ON f.payment_id = pm.payment_id;



SELECT *
FROM vw_sales_analysis
LIMIT 10;








































