# Retail Sales Business Intelligence Dashboard (Power BI)

## Project Overview

This project delivers a complete, end-to-end Business Intelligence (BI solution for retail sales analysis using SQL, Power BI, and DAX. The primary objective is to transform raw transactional sales data into reliable, insightful, and executive-ready analytics that support strategic decision-making.

The solution follows real-world BI best practices including dimensional modeling, centralized metric governance, advanced time intelligence, and professional dashboard storytelling. The final output is a multi-page Power BI dashboard designed for executives, managers, and analysts.

---

## Business Objectives

The dashboard answers critical business questions such as:

- What is the overall sales and profit performance over time?
- How is the business performing Year-to-Date (YTD) and Year-over-Year (YoY)?
- Which customers drive the most revenue and profit?
- Which product categories and sub-categories are most profitable?
- How do discounts affect revenue, profitability, and margins?
- What actionable insights can leadership use to improve performance?

---

## Dataset Description

- **Source:** Superstore retail transactional dataset  
- **Time Coverage:** 24 months  
- **Granularity:** Order-level transactions  

Key attributes include:
- Order and shipping dates
- Customer demographics and geography
- Product hierarchy
- Sales revenue, profit, discounts, quantities
- Shipping costs and fulfillment details

The dataset was cleaned, validated, and enriched before analytical modeling.

---

## Data Architecture & Modeling

The project follows a **star schema** design optimized for analytical performance and clarity in Power BI.

### Fact Table
- **Sales** (`fact_sales_bi`)

### Dimension Tables
- **Date** (`dim_date`)
- **Customer** (`dim_customer`)
- **Product** (`dim_product`)
- **Shipping** (`dim_ship_mode`)

### Modeling Best Practices Applied
- One-to-many relationships from dimensions to fact
- Single-direction filtering
- Surrogate keys for all dimensions
- Dedicated Measures table for DAX
- Hidden technical columns to maintain a clean field list
- Centralized business logic via DAX measures

This structure ensures scalability, consistency, and high-performance analytics.

---

## Data Processing Workflow

1. Raw CSV data stored in the **raw data layer**
2. Data cleaning and feature engineering using Python
3. Cleaned datasets stored in the **processed data layer**
4. Schema and fact table creation in SQL
5. Dimensional modeling (fact & dimensions)
6. Analytical views created for validation and exploration
7. Power BI data model built on the star schema
8. DAX measures developed in a centralized Measures table
9. Dashboard design and validation

---

## Measures & Analytics Strategy

All KPIs and calculations are implemented using **DAX** and stored in a **dedicated Measures table** to enforce metric governance and maintainability.

### Core KPIs
- Total Sales
- Total Profit
- Total Orders
- Average Order Value
- Profit Margin

### Time Intelligence
- Year-to-Date (YTD)
- Last Year (LY)
- Year-over-Year (YoY) Growth
- Monthly and annual trends

All measures are fully slicer-aware and dynamically respond to Date, Customer, Product, and Geography filters.

---

## Dashboard Pages

### 1. Executive Overview

Designed for senior leadership and decision-makers.

Key insights:
- Total sales, profit, and orders
- YTD and YoY performance
- Sales and profit trends over time
- Category contribution analysis
- High-level performance indicators

---

### 2. Customer Intelligence

Focused on customer behavior and value.

Key insights:
- Top customers by sales and profit
- Customer revenue concentration
- Profitability by customer segment
- Discount impact on customer margins
- Actionable customer segmentation insights

---

## Data Validation & Quality Assurance

- All DAX measures validated against SQL aggregations
- Slicer interactions tested across all visuals
- No ambiguous or bidirectional relationships
- Clean, user-friendly field list
- Consistent KPI definitions across all report pages

---

## Tools & Technologies

- **SQL** – Data modeling, fact & dimension tables, views
- **Python (Pandas, NumPy)** – Data cleaning and feature engineering
- **Power BI Desktop** – Data modeling, DAX, visualization
- **DAX** – Business logic and time intelligence
- **Power Query** – Data transformation
- **GitHub** – Version control and portfolio hosting

---

## Repository Structure

├── data
│ ├── raw
│ │ └── superstore_sales_clean.csv
│ └── processed
│ └── fact_sales_clean.csv
│
├── sql
│ ├── 01_schema
│ │ ├── dim_date.sql
│ │ ├── dim_customer.sql
│ │ ├── dim_product.sql
│ │ └── dim_ship_mode.sql
│ │
│ ├── 02_facts
│ │ └── fact_sales_bi.sql
│ │
│ └── 03_views
│ ├── vw_kpi_summary.sql
│ ├── vw_monthly_sales.sql
│ ├── vw_customer_intelligence.sql
│ ├── vw_product_performance.sql
│ └── vw_discount_performance.sql
│
├── powerbi
│ └── Retail_Sales_BI_Dashboard.pbix
│
├── assets
│ └── architecture_diagram.png
│
└── README.md


---

## Business Value Delivered

This BI solution enables:

- Faster executive decision-making
- Clear visibility into revenue and profit drivers
- Identification of high-value customers
- Smarter discount and pricing strategies
- A scalable analytics framework for future growth

---

## Author

**John Olalemi**  
Business Intelligence Analyst | Data Analyst  

LinkedIn: [ADD LINK]  
GitHub: [ADD LINK]  

---

## Final Notes

This project demonstrates real-world Business Intelligence practices, including professional dimensional modeling, advanced DAX analytics, and executive-focused dashboard design. It reflects how production-grade BI solutions are built, governed, and delivered in modern data-driven organizations.
