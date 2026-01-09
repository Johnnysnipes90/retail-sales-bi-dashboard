# 📊 Retail Sales Business Intelligence Dashboard (Power BI)

![Power BI](https://img.shields.io/badge/Power%20BI-Business%20Intelligence-yellow)
![SQL](https://img.shields.io/badge/SQL-Data%20Modeling-blue)
![DAX](https://img.shields.io/badge/DAX-Analytics-orange)
![Python](https://img.shields.io/badge/Python-Data%20Preparation-green)
![Status](https://img.shields.io/badge/Status-Completed-success)

---

## 📖 Project Overview

This project delivers a **complete, end-to-end Business Intelligence (BI) solution** for retail sales analysis using **Python, SQL, Power BI, and DAX**.

The primary objective is to transform **raw transactional sales data** into **clean, reliable, and executive-ready analytics** that support strategic and operational decision-making.

The solution follows **real-world BI best practices**, including:
- Data cleaning and feature engineering in Python
- Dimensional (star schema) modeling in SQL
- Centralized KPI governance using DAX
- Advanced time intelligence (YTD, YoY)
- Executive-focused dashboard storytelling

The final deliverable is a **multi-page Power BI dashboard** designed for **executives, managers, and analysts**.

---

## 🎯 Business Objectives

This dashboard answers critical business questions such as:

- What is the overall sales and profit performance?
- How is the business performing **Year-to-Date (YTD)** and **Year-over-Year (YoY)**?
- Which customers generate the most revenue and profit?
- Which product categories and sub-categories drive performance?
- How do discounts affect revenue, profitability, and margins?
- Where can leadership take data-driven action?

---

## 🗂️ Dataset Overview

### Dataset Summary

| Attribute | Description |
|--------|------------|
| Dataset Name | Superstore Retail Sales |
| Total Records | 51,291 rows |
| Total Features | 21 columns |
| Time Coverage | (2011-14) 4 years |
| Granularity | Order-level transactions |
| Missing Values | None (after cleaning) |
| Data Types | Numeric & Categorical |

The dataset represents **global retail transactions**, including sales, customer attributes, product hierarchy, shipping details, and geographic dimensions.

---

### Dataset Schema

| Column Name | Description |
|-----------|------------|
| order_id | Unique identifier for each order |
| order_date | Date the order was placed |
| ship_date | Date the order was shipped |
| ship_mode | Shipping method |
| customer_name | Customer full name |
| segment | Customer segment |
| state | State |
| country | Country |
| market | Global market |
| region | Sales region |
| product_id | Product identifier |
| category | Product category |
| sub_category | Product sub-category |
| product_name | Product description |
| sales | Revenue generated |
| quantity | Units sold |
| discount | Discount applied |
| profit | Profit earned |
| shipping_cost | Cost of shipping |
| order_priority | Fulfillment priority |
| year | Order year |

---

### Key Dataset Characteristics

#### Shipping Mode Distribution
- Standard Class: ~60%
- Second Class: ~20%
- Other modes: ~20%

#### Customer Segmentation
- Consumer: ~52%
- Corporate: ~30%
- Other segments: ~18%

#### Geographic Coverage
- Countries: 1,400+ unique
- States: 700+ unique
- Markets: APAC, LATAM, US, EMEA
- Top Country: United States (~19%)
- Top Market: APAC (~21%)

---

## 🧹 Data Cleaning & Feature Engineering (Python)

Raw data was cleaned and enriched using **Python (Pandas & NumPy)** before analytical modeling.

### Cleaning & Validation Steps

1. Parsed order and shipping dates into proper datetime formats
2. Converted year to integer for time analysis
3. Removed duplicate records
4. Validated numeric fields (sales, profit, discount, shipping cost)
5. Ensured quantity was stored as integer
6. Removed rows with invalid or missing critical values
7. Created operational and financial metrics
8. Bucketed discounts for BI analysis

### Engineered Features
- `shipping_days` → Order fulfillment duration
- `profit_margin` → Profitability efficiency
- `discount_band` → Discount impact analysis

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
`
retail-sales-bi-dashboard/
│
├── data/
│   ├── raw/                     # Original untouched data
│   │   └── superstore_sales_clean.csv
│   │
│   ├── processed/               # Cleaned & feature-engineered data
│   │   └── fact_sales_clean.csv
│
├── scripts/
│   └── data_cleaning.py          # Python data preparation pipeline
│
├── sql/
│   ├── schema/                   # Tables & star schema
│   │   ├── dim_date.sql
│   │   ├── dim_customer.sql
│   │   ├── dim_product.sql
│   │   ├── dim_ship_mode.sql
│   │   └── fact_sales_bi.sql
│   │
│   ├── views/                    # BI-ready analytical views
│   │   ├── vw_kpi_summary.sql
│   │   ├── vw_monthly_sales.sql
│   │   ├── vw_customer_intelligence.sql
│   │   ├── vw_product_performance.sql
│   │   └── vw_discount_performance.sql
│
├── powerbi/
│   └── Retail_Sales_BI_Dashboard.pbix
│
├── assets/
│   ├── architecture_diagram.png
│   └── dashboard_screenshots/
│
├── README.md
└── LICENSE
`

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
