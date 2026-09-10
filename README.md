# NAZWA PROJEKTU

## Project Overview

This project presents an end-to-end analysis of Brazilian e-commerce data from Olist.
The main objective was to transform raw transactional data into a structured analytical model and use it to evaluate the company’s performance across several key business areas.
The analysis focuses on five main perspectives:
- Sales – revenue, order volume, basket size and sales trends
- Delivery – delivery time, delays and on-time delivery performance
- Customers – customer distribution, purchasing behavior and revenue contribution
- Portfolio Analysis – product, seller and category concentration
- Order Economics – order value, number of items per order and shipping costs
The project covers the full analytical workflow, including data quality validation, data transformation in SQL, dimensional data modeling, DAX measure creation, Power BI dashboard development and business insight generation.

#  Dataset

The project is based on the Brazilian E-Commerce Public Dataset by Olist, which contains transactional data from a Brazilian online marketplace.
The dataset covers orders placed between 2016 and 2018 and includes information about:
- orders and order status
- customers and their geographic location
- products and product categories
- sellers
- order items
- payments
- customer reviews
- delivery and shipping dates
- freight costs
The original dataset consists of multiple related tables, which were later transformed into an analytical data model for reporting and analysis.

# Tools Used

- Microsoft SQL Server (local instance) – storing the source data and providing the analytical views used by Power BI
- SQL Server Management Studio (SSMS) – data quality checks, SQL transformations and creation of fact and dimension views
- Power Query – additional data preparation and cleaning in Power BI
- Power BI – data modeling, DAX measures, dashboard development and visualization
- Git / GitHub – project documentation and version control

# Project Workflow

The project was developed in the following stages:
1. Dataset Acquisition – the Brazilian E-Commerce dataset was downloaded from Kaggle.
2. Data Import – the raw source files were loaded into a local Microsoft SQL Server database.
3. Data Quality Checks – SQL queries were used to identify duplicates, missing values, inconsistent records and potential relationship issues.
4. Data Preparation and Modeling – SQL views were created to transform the raw data into fact and dimension structures suitable for analytical reporting.
5. Power BI Integration – the prepared SQL views were connected to Power BI from the local SQL Server instance.
6. Data Model Development – relationships between fact and dimension entities were configured in Power BI.
7. DAX Development – measures were created to calculate key business metrics and support analytical reporting.
8. Dashboard Development – five dashboard pages were created covering Sales, Delivery, Customers, Portfolio Analysis and Order Economics.
9. Business Analysis – the final dashboards were used to identify key trends, performance drivers and business insights.


# Data Quality Check

Before building the analytical model, the source data was validated in SQL to identify potential data quality issues that could affect the analysis.
The checks included:
- duplicate records and duplicate identifiers
- missing or null values in key columns
- uniqueness of primary identifiers
- consistency between related tables
- unmatched records between entities
- invalid or incomplete categorical values
- basic validation of dates and transactional records
The results of these checks were used to determine which records required cleaning, filtering or additional handling before the data was prepared for reporting.
The full SQL script used for data validation is available here:
View data quality checks

# Data Model

The analytical model was built using a dimensional modeling approach based on fact and dimension structures.
SQL views were created to prepare the data before loading it into Power BI. The final model separates transactional data from descriptive business entities, making the dataset easier to analyze and maintain.
The model includes fact views containing order-related transactional data and dimension views describing entities such as customers, products and sellers.
Relationships between the fact and dimension entities were then configured in Power BI to support filtering and calculation of business metrics.

The SQL scripts used to create the analytical views are available here:
- Create dimension views
- Create fact views

# Dashboard Pages

The Power BI report consists of five analytical pages, each focused on a different area of e-commerce performance.

**Sales:**
Provides an overview of revenue, order volume, basket size and sales performance across time, states and product categories.
<br> [View Sales Dashboard](images/sales_dashboard_2018.png)
<br> [View Sales Dashboard](images/sales_overview_2018.png)

**Delivery:**
Analyzes delivery time, on-time delivery performance and late deliveries across different periods and locations.
<br> [View Delivery Dashboard](images/delivery_dashboard_2018.png)

**Customers:**
Focuses on customer distribution, purchasing behavior, revenue contribution and geographic differences.
<br> [View Customer Dashboard](images/customer_dashboard_2018.png)

**Portfolio Analysis:**
Evaluates the concentration and contribution of products, categories and sellers to overall business performance.
<br> [View Portfolio Analysis Dashboard](images/portfolio_analysis_dashboard_2018.png)

**Order Economics:**
Analyzes order value, basket composition, number of items per order and freight costs to better understand order-level economics.
<br> [View Order Economics Dashboard](images/order_economics_dashboard_2018.png)

# Key Business Insights

**Sales**
- Growth was volume-driven: revenue increased by 20.0% in 2018, almost entirely supported by 19.8% growth in orders, while Average Order Value remained virtually unchanged at +0.2%.
- Product mix remained relatively stable: Health & Beauty, Watches & Gifts, Bed Bath Table, and Sports & Leisure consistently ranked among the leading revenue categories.
  
**Delivery**
- Delivery became faster in 2018, with average delivery time decreasing by 7.1% and average delay decreasing by 15.5%.
- Despite faster deliveries, on-time delivery performance declined from 94.6% to 92.5% in 2018.
  
**Customers**
- The customer base grew by 19.8% in 2018, while revenue per customer remained almost unchanged at +0.2%.
- Customer volume is concentrated in the Southeast, while some smaller Northern and Northeastern states generate higher revenue per customer.

**Portfolio Analysis**
- Revenue is highly concentrated: just 21% of sellers generate 80% of total revenue.
- Seller concentration strengthened over time: only 17.6% of sellers generated 80% of revenue in 2018, compared with 31.7% in 2016.

**Order Economics**
- Around 90% of orders contain just one item, keeping average basket size at only 1.14 items per order.
- Freight costs became a growing burden, rising from 14.9% of order value in 2016 to 17.0% in 2018.

<br> [View insights Dashboard](images/insights_dashboard.png)

# Repository Structure 

```text
brazilian-ecommerce-analysis/
│
├── README.md
│
├── sql/
│   ├── 01_data_quality_check.sql
│   ├── 02_create_dimensions.sql
│   └── 03_create_facts.sql
│
└── images/
    ├── data_model.png
    ├── sales_dashboard_overview.png
    ├── sales_dashboard_2018.png
    ├── delivery_dashboard_2018.png
    ├── customer_dashboard_2018.png
    ├── portfolio_analysis_dashboard_2018.png
    ├── order_economics_dashboard_2018.png
    └── insights_dashboard.png
```

