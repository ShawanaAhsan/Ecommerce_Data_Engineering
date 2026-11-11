# Ecommerce_Data_Engineering
This project demonstrates an end-to-end data engineering workflow using Python, Pandas, MySQL, SQL, and Power BI.

The project extracts raw e-commerce sales data, performs data cleaning and validation, transforms the dataset, loads structured data into a MySQL database, performs SQL analysis, and connects the database to Power BI for reporting.

## Dataset

The dataset contains 5,000 e-commerce sales records and 12 original columns, including order information, customer information, product category, region, payment method, delivery time, customer rating, discount, and revenue.

## Technologies

- Python
- Pandas
- NumPy
- MySQL
- SQL
- SQLAlchemy
- Power BI

## ETL Process

### Extract
- Imported raw CSV data using Pandas
- Inspected data types, missing values, duplicates, and unique values

### Transform
- Converted order dates
- Removed duplicate records
- Validated numerical values
- Created year, month, quarter, and month name
- Calculated gross sales and discount amount
- Performed revenue validation

### Load
- Created a MySQL database
- Designed dimension and fact tables
- Loaded processed data into MySQL
- Created a reporting view for analysis

## Database Design

The database contains:

- `dim_customer`
- `dim_product`
- `dim_payment`
- `dim_date`
- `fact_sales`

## SQL Analysis

The project includes SQL queries for:

- Revenue analysis
- Regional performance
- Product category performance
- Monthly sales trends
- Payment method analysis
- Customer performance
- Delivery performance
- Customer ratings

## Dashboard

A Power BI dashboard was developed to visualize:

- Total revenue
- Total orders
- Total customers
- Average customer rating
- Monthly revenue
- Regional revenue
- Category revenue
- Payment method performance
- Delivery performance

<img width="1538" height="805" alt="dashboard" src="https://github.com/user-attachments/assets/8b005cba-4980-4a85-86c9-8a76eaaec6df" />


## Key Skills Demonstrated

- ETL Pipeline Development
- Data Cleaning
- Data Validation
- Data Transformation
- Relational Database Design
- MySQL
- SQL
- Python/Pandas
- Data Integration
- Business Intelligence Reporting
