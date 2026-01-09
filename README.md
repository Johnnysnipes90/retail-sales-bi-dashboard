# Retail Sales Business Intelligence Dashboard (Power BI)

## Project Overview

This project presents a complete end-to-end Business Intelligence (BI) solution for retail sales analysis using SQL, Power BI, and DAX. The goal of the project is to transform raw transactional sales data into meaningful, accurate, and actionable business insights through professional data modeling, advanced analytics, and executive-level dashboard design.

The final deliverable is a multi-page Power BI dashboard built to support data-driven decision-making for executives, business managers, and data analysts. The project follows industry best practices in dimensional modeling, metric governance, performance optimization, and data storytelling.

---

## Business Objectives

The dashboard is designed to answer key business questions, including:

- What are the overall sales, profit, and order trends over time?
- How is the business performing year-over-year and year-to-date?
- Which customers generate the highest revenue and profit?
- Which product categories and sub-categories drive profitability?
- How do discounts impact revenue, margins, and customer behavior?
- What insights can leadership act on to improve business performance?

---

## Dataset Description

- Source: superstore_sales_data.csv
- Time Period: 24 months
- Granularity: Transaction-level sales records

Key data attributes include order details, customer information, product hierarchy, geographic attributes, sales revenue, profit, discounts, quantities, and shipping information.

The dataset was cleaned, validated, and transformed before being modeled for analytical reporting.

---

## Data Architecture & Modeling

The data model follows a star schema design optimized for Power BI performance and analytical clarity.

Fact Table:
- Sales (fact_sales_bi)

Dimension Tables:
- Date (dim_date)
- Customer (dim_customer)
- Product (dim_product)
- Shipping (dim_ship_mode)

Model characteristics:
- One-to-many relationships from dimensions to fact table
- Single-direction filtering
- Surrogate keys for dimensions
- Centralized metric logic using DAX measures
- Hidden technical columns to maintain a clean field list

This structure ensures fast query performance, consistent metrics, and scalable reporting.

---

## Data Processing Workflow

1. Raw CSV data ingested into SQL
2. Data cleaning and validation
3. Creation of fact and dimension tables
4. Construction of analytical views for validation and exploration
5. Data loaded into Power BI
6. Relationship modeling and optimization
7. Creation of a dedicated Measures table
8. Development of DAX measures
9. Dashboard design and validation

---

## Measures & Analytics

All business logic is implemented using DAX and stored in a dedicated Measures table to ensure proper metric governance and maintainability.

Core metrics include:
- Total Sales
- Total Profit
- Total Orders
- Average Order Value
- Profit Margin

Time intelligence metrics include:
- Year-to-Date (YTD)
- Last Year (LY)
- Year-over-Year (YoY) Growth
- Monthly and annual trends

All measures are responsive to slicers and filters across the report.

---

## Dashboard Pages

### Executive Overview

This page provides a high-level summary of overall business performance and is designed for executive decision-makers.

Key insights include:
- Total sales, profit, and orders
- Sales and profit trends over time
- Year-over-year growth indicators
- Category-level contribution to revenue and profit

---

### Customer Intelligence

This page focuses on customer behavior and value.

Key insights include:
- Top customers by sales and profit
- Customer contribution analysis
- Discount sensitivity and profitability
- Revenue concentration and customer segmentation

---

## Data Validation & Quality Assurance

- All DAX measures validated against SQL aggregates
- Slicers tested across all visuals for proper interactivity
- No ambiguous relationships in the model
- Clean and organized field list
- Consistent definitions for all KPIs

---

## Tools & Technologies

- SQL for data extraction, transformation, and modeling
- Power BI Desktop for data modeling and dashboard development
- DAX for analytics and time intelligence
- Power Query for data transformation
- GitHub for version control and portfolio hosting

---

## Repository Structure

├── data  
│   └── superstore_sales_data.csv  
├── sql  
│   ├── schema  
│   └── views  
├── powerbi  
│   └── Retail_Sales_BI_Dashboard.pbix  
├── assets  
│   └── architecture_diagram.png  
└── README.md  

---

## Business Value

This project delivers a scalable BI solution that enables:

- Faster and more confident executive decision-making
- Clear visibility into revenue and profit drivers
- Identification of high-value customers
- Improved pricing and discount strategies
- A reusable analytics framework for future reporting

---

## Author

John Olalemi  
Data Analyst / Business Intelligence Analyst  

LinkedIn: [ADD LINK]  
GitHub: [ADD LINK]  

---

## Final Notes

This project demonstrates real-world Business Intelligence practices, including professional data modeling, advanced DAX development, and executive-focused dashboard design. It reflects how analytics solutions are built and delivered in production business environments.
