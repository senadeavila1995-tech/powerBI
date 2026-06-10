
CREATE DATABASE IF NOT EXISTS pos_analytics;
USE pos_analytics;

CREATE TABLE dim_date (
 date_id INT PRIMARY KEY,
 full_date DATE,
 year INT,
 quarter INT,
 month INT,
 month_name VARCHAR(20),
 day INT,
 weekday VARCHAR(20)
);

CREATE TABLE dim_product (
 product_id INT PRIMARY KEY,
 product_name VARCHAR(100),
 category VARCHAR(50),
 unit_price DECIMAL(10,2)
);

CREATE TABLE dim_customer (
 customer_id INT PRIMARY KEY,
 customer_name VARCHAR(100),
 city VARCHAR(100),
 segment VARCHAR(50)
);

CREATE TABLE dim_employee (
 employee_id INT PRIMARY KEY,
 employee_name VARCHAR(100),
 role VARCHAR(50)
);

CREATE TABLE fact_sales (
 sale_id INT PRIMARY KEY,
 date_id INT,
 product_id INT,
 customer_id INT,
 employee_id INT,
 quantity INT,
 total_amount DECIMAL(10,2),
 FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
 FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
 FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
 FOREIGN KEY (employee_id) REFERENCES dim_employee(employee_id)
);
