# 📊 Retail Sales Business Intelligence Dashboard (Power BI)

![Power BI](https://img.shields.io/badge/Power%20BI-Business%20Intelligence-yellow)
![SQL](https://img.shields.io/badge/SQL-Data%20Modeling-blue)
![DAX](https://img.shields.io/badge/DAX-Analytics-orange)
![Python](https://img.shields.io/badge/Python-Data%20Preparation-green)
![Status](https://img.shields.io/badge/Status-Completed-success)

---

## 📖 Project Overview

This project delivers a **production-grade, end-to-end Business Intelligence (BI) solution** for retail sales analytics using **Python, SQL, Power BI, and DAX**.

The objective is to transform **raw transactional retail data** into **trusted, scalable, and executive-ready insights** that support decision-making across **sales, marketing, and operations**.

The solution follows **real-world BI engineering best practices**, including:

- Structured data preparation and validation
- Dimensional (star schema) data modeling
- Centralized KPI and metric governance
- Robust time-intelligence analytics
- Executive-focused dashboard storytelling

The final deliverable is a **four-page Power BI dashboard** designed for **executives, business leaders, and analysts**.

---

## 🧠 Solution Architecture

This project follows a **modern BI architecture**, separating ingestion, transformation, modeling, analytics, and visualization layers to ensure **scalability, accuracy, and governance**.

### Architecture Layers

- **Data Layer:** Raw retail transaction data (CSV)
- **Processing Layer:** Python-based data cleaning and feature engineering
- **Modeling Layer:** SQL star schema (fact and dimension tables)
- **Analytics Layer:** Power BI semantic model with centralized DAX measures
- **Presentation Layer:** Interactive, executive-ready dashboards

📌 _This layered architecture mirrors enterprise BI systems and ensures consistent, governed business metrics._

### Architecture Diagram

![Solution Architecture](assets/architecture_diagram.png)

---

## 🎯 Business Objectives

The dashboard enables stakeholders to answer key business questions such as:

- How is the business performing overall in terms of sales and profit?
- What are the **Year-to-Date (YTD)** and **Year-over-Year (YoY)** performance trends?
- Which customers contribute the most to revenue and profitability?
- Which product categories and sub-categories drive growth?
- How do discount strategies impact margins and profit?
- Where should leadership focus to improve performance and efficiency?

---

## 🗂️ Dataset Overview

### Dataset Summary

| Attribute     | Description              |
| ------------- | ------------------------ |
| Dataset Name  | Superstore Retail Sales  |
| Records       | 51,291 rows              |
| Features      | 21 columns               |
| Time Coverage | 2011 – 2014              |
| Granularity   | Order-level transactions |
| Data Quality  | Cleaned & validated      |
| Data Types    | Numeric & categorical    |

The dataset captures **global retail transactions**, including customer attributes, product hierarchies, shipping details, financial metrics, and geographic information.

---

### Dataset Schema (Key Fields)

| Column                    | Description             |
| ------------------------- | ----------------------- |
| order_id                  | Unique order identifier |
| order_date                | Date order was placed   |
| ship_date                 | Date order was shipped  |
| ship_mode                 | Shipping method         |
| customer_name             | Customer name           |
| segment                   | Customer segment        |
| country / region / market | Geographic attributes   |
| product_id                | Product identifier      |
| category / sub_category   | Product hierarchy       |
| sales                     | Revenue generated       |
| quantity                  | Units sold              |
| discount                  | Discount applied        |
| profit                    | Profit earned           |
| shipping_cost             | Shipping cost           |
| order_priority            | Fulfillment priority    |
| year                      | Order year              |

---

## 🧹 Data Preparation & Feature Engineering

Raw data is processed using **Python (Pandas & NumPy)** before being loaded into the analytical database.

### Data Cleaning

- Parsed order and shipping dates into standardized datetime formats
- Standardized numeric fields (sales, profit, discount, shipping cost)
- Converted quantities to integer values
- Removed duplicate and invalid records
- Ensured consistency across categorical attributes

### Feature Engineering

Additional analytical features were created to support BI insights:

- **Shipping Days** – Order fulfillment duration
- **Profit Margin** – Profitability efficiency
- **Discount Bands** – Grouped discount levels for pricing impact analysis

All cleaned and enriched data is written to a **processed data layer**, preserving the raw source.

---

### Data Governance & Lineage

- Raw source data is **never modified directly**
- All transformations occur in the Python ETL layer
- Outputs are written to a separate processed dataset

This ensures reproducibility, auditability, metric consistency, and protection of source data integrity.

---

## 🧱 Data Modeling & Semantic Layer

The analytical database uses a **star schema**, optimized for Power BI performance and maintainability.

### Fact Table

- **Sales** (`fact_sales_bi`)

### Dimension Tables

- **Date**
- **Customer**
- **Product**
- **Shipping**

### Modeling Best Practices Applied

- One-to-many relationships (dimensions → fact)
- Single-direction filtering
- Surrogate keys for all dimensions
- Dedicated **Measures table** in Power BI
- Hidden technical columns for a clean field list
- Proper Date table marked for time intelligence

---

### ⚠️ Production Modeling Note

The dataset does not provide a unique `customer_id`.  
For demonstration purposes, customers were identified using a composite of name, location, and segment.

**In a production environment, a surrogate `customer_id` would be implemented** to prevent duplication and aggregation errors.

---

## 📐 Measures & Analytics Strategy

All business logic is implemented using **DAX** and centralized in a dedicated **Measures table**.

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
- Monthly and yearly trend analysis

All measures are fully **slicer-aware** and respond dynamically to Date, Product, Customer, and Geography filters.

---

## 📊 Dashboard Pages

### 1️⃣ Executive Overview

**Audience:** Senior Leadership  
**Purpose:** Business health snapshot

- Revenue & profit KPIs
- YTD and YoY growth indicators
- Monthly sales trends
- Category and regional revenue drivers
- Executive insight callouts

### 2️⃣ Sales & Profit Deep Dive

**Audience:** Commercial & Product Teams  
**Purpose:** Identify revenue and margin drivers

- Category → sub-category performance
- Profitability analysis
- Discount vs profit impact
- Margin leakage detection

### 3️⃣ Customer Intelligence

**Audience:** Sales & Marketing  
**Purpose:** Understand customer value & risk

- Top customers by revenue and profit
- Customer segmentation
- Pareto (80/20) revenue concentration analysis
- Average order value and discount behavior

### 4️⃣ Operations & Shipping Performance

**Audience:** Operations & Supply Chain  
**Purpose:** Operational efficiency insights

- Shipping efficiency KPIs
- Average shipping days by mode
- Cost vs speed trade-off analysis
- Operational impact on profit margins

---

## 📸 Dashboard Preview

### 1️⃣ Executive Overview — Business Health Snapshot

![Executive Overview](assets/dashboard_screenshots/01_executive_overview.png)

**Key decisions enabled:**

- Is the business growing or declining?
- Are sales and profit trends aligned?
- Which regions and categories drive performance?

---

### 2️⃣ Sales & Profit Deep Dive — Revenue & Margin Drivers

![Sales & Profit Deep Dive](assets/dashboard_screenshots/02_sales_profit_deep_dive.png)

**Key decisions enabled:**

- Which products drive profit vs just revenue?
- Where is margin leakage occurring?
- How do discounts impact profitability?

---

### 3️⃣ Customer Intelligence — Value & Concentration Risk

![Customer Intelligence](assets/dashboard_screenshots/03_customer_intelligence.png)

**Key decisions enabled:**

- Who are the most valuable customers?
- How concentrated is revenue (Pareto risk)?
- Which segments justify focused investment?

---

### 4️⃣ Operations & Shipping — Cost vs Speed Trade-offs

![Operations & Shipping](assets/dashboard_screenshots/04_operations_shipping.png)

**Key decisions enabled:**

- Which shipping modes are inefficient?
- Are higher costs justified by speed?
- How does fulfillment affect profit margins?

---

## 🔍 Key Insights Delivered

- Revenue is **highly concentrated**, with a small subset of customers driving a disproportionate share of sales
- Several sub-categories generate strong revenue but **negatively impact margins**, indicating pricing or cost issues
- Increased discounting correlates with **margin pressure** in specific categories
- Certain shipping modes incur **higher costs without proportional speed benefits**, impacting profitability

---

## ✅ Data Validation & Quality Assurance

- DAX measures validated against SQL aggregations
- Slicer interactions tested across all visuals
- No ambiguous or bi-directional relationships
- Clean and intuitive field list
- Consistent KPI definitions across pages

---

## 🔁 Reproducibility Guide

### Prerequisites

- Python 3.9+
- PostgreSQL
- Power BI Desktop
- Git

### Steps

```bash
git clone https://github.com/Johnnysnipes90/retail-sales-bi-dashboard.git
cd retail-sales-bi-dashboard
```

# 1) Run Python ETL

python run_etl.py

# 2) Create schema + load into PostgreSQL (run SQL scripts in sql/schema/)

# 3) Open the Power BI file and refresh

```

- Execute SQL scripts in sql/schema/
- Load processed data into PostgreSQL
- Open Retail_Sales_BI_Dashboard.pbix
- Validate relationships and measures

---

retail-sales-bi-dashboard/
│
├── data/
│   ├── raw/
│   │   └── superstore_sales_clean.csv
│   └── processed/
│       └── fact_sales_clean.csv
│
├── src/
│   └── sales_etl.py
│
├── sql/
│   ├── schema/
│   └── views/
│
├── powerbi/
│   └── Retail_Sales_BI_Dashboard.pbix
│
├── assets/
│   ├── architecture_diagram.png
│   └── dashboard_screenshots/
│
├── run_etl.py
├── requirements.txt
├── README.md
└── LICENSE
---

## 🛠️ Tools & Technologies

| Tool        | Purpose                   |
| ----------- | ------------------------- |
| Python      | Data preparation & ETL    |
| SQL         | Dimensional modeling      |
| Power BI    | Analytics & visualization |
| DAX         | KPIs & time intelligence  |
| Power Query | Data shaping              |
| GitHub      | Version control           |

---

## 📈 Business Value Delivered

This solution enables:

- Faster executive decision-making
- Clear visibility into revenue and profit drivers
- Identification of high-value customers
- Smarter pricing and discount strategies
- A scalable foundation for future analytics

---

## 👤 Author

**Olalemi John Oluwatosin**
Business Intelligence Analyst | Data Analyst

📧 Email: **johnolalemi90@gmail.com**
🔗 LinkedIn: https://www.linkedin.com/in/john-olalemi
🔗 GitHub: https://github.com/Johnnysnipes90

---

## 🏁 Final Notes

This project is a **real-world enterprise BI delivery standards**, combining data engineering, semantic modeling, and executive-level storytelling. It demonstrates how scalable, governed, and decision-focused BI solutions are built in modern data-driven organizations.

```

```

```
