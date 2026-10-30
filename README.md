# Data Warehouse and Analytics Project

Welcome to my **Data Warehouse and Analytics Project** repository! 🚀

This is a portfolio project. It shows how to build a data warehouse from scratch, clean the data, and turn it into simple insights. I built it to practice real data engineering and analytics work.

---

## 🏗️ Data Architecture

This project uses the **Medallion Architecture** with three layers:

1. **Bronze Layer** – Raw data from the source systems. Loaded from CSV files into SQL Server as is.
2. **Silver Layer** – Cleaned and standardized data. Fixes errors, duplicates, and missing values.
3. **Gold Layer** – Business-ready data. Organized in a star schema for reports and analysis.

---

## 🚀 Project Requirements

### Building the Data Warehouse (Data Engineering)

#### Objective
Build a modern data warehouse using SQL Server to bring sales data together and support reports and decision-making.

#### Specifications
- **Data Sources**: Import data from two source systems (ERP and CRM) provided as CSV files.
- **Data Quality**: Clean the data and fix quality issues before analysis.
- **Integration**: Combine both sources into one easy-to-use data model for analytical queries.
- **Scope**: Use the latest dataset only. No need to keep history.
- **Documentation**: Provide clear documentation of the data model for business users and analytics teams.

---

### BI: Analytics and Reporting (Data Analytics)

#### Objective
Build SQL-based analytics to give clear insights into:

- **Customer Behavior**
- **Product Performance**
- **Sales Trends**

These insights help stakeholders make better business decisions.

---

## 🛠️ Tools Used

- **SQL Server** – Database and data warehouse
- **SQL** – Data cleaning, transformation, and analysis
- **CSV Files** – Source data (ERP and CRM)
- **Git and GitHub** – Version control and portfolio
- **Draw.io** – Data architecture and data model diagrams

---

## 📂 Repository Structure

```
sql-data-warehouse-project/
│
├── datasets/          # Raw ERP and CRM CSV files
├── docs/              # Architecture, data model, and data catalog
├── scripts/
│   ├── bronze/        # Load raw data
│   ├── silver/        # Clean and transform data
│   └── gold/          # Build final views (star schema)
├── tests/             # Data quality checks
└── README.md
```

---

## 🔄 How It Works

1. **Extract** – Read the ERP and CRM CSV files.
2. **Load (Bronze)** – Save the raw data in the database.
3. **Transform (Silver)** – Clean, fix, and standardize the data.
4. **Model (Gold)** – Build fact and dimension tables for reporting.
5. **Analyze** – Run SQL queries to find insights.

---

## 📚 What I Learned

I studied the core skills for this project on DataCamp:

- Joining Data in SQL
- Introduction to Relational Databases in SQL
- Database Design
- Data Warehousing Concepts
- Introduction to Data Engineering
- Introduction to Snowflake SQL

---

## 👤 About Me

Hi, I'm **Jhonas Sotero**, a Full Stack Web Developer and BSIT graduate from STI College San Pablo. I built **SmartEssay**, my capstone project, and I was a National Champion at Tagisan ng Talino: Codefest 2025. I am now growing my skills in SQL and data engineering.

- 🌐 Portfolio: [jhonas-sotero.vercel.app](https://jhonas-sotero.vercel.app)
- 💼 LinkedIn: [linkedin.com/in/jhonas-sotero](https://linkedin.com/in/jhonas-sotero)
- 📧 Email: soterojhonas028@gmail.com

---

## 🛡️ License

This project is licensed under the MIT License. You can use, change, and share it with credit.
