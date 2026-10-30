Data Warehouse and Analytics Project

Welcome to the Data Warehouse and Analytics Project repository! 🚀

This project demonstrates a comprehensive data warehousing and analytics solution, from building a data warehouse to generating actionable insights. Designed as a portfolio project, it highlights industry best practices in data engineering and analytics.

🚀 Project Requirements
Building the Data Warehouse (Data Engineering)
Objective

Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

Specifications
Data Sources: Import data from two source systems (ERP and CRM) provided as CSV files.
Data Quality: Cleanse and resolve data quality issues prior to analysis.
Integration: Combine both sources into a single, user-friendly data model designed for analytical queries.
Scope: Focus on the latest dataset only; historization of data is not required.
Documentation: Provide clear documentation of the data model to support both business stakeholders and analytics teams.
BI: Analytics & Reporting (Data Analytics)
Objective

Develop SQL-based analytics to deliver detailed insights into:

Customer Behavior
Product Performance
Sales Trends

These insights empower stakeholders with key business metrics, enabling strategic decision-making.

🏗️ Data Architecture

The project follows the Medallion Architecture with three layers:

Bronze Layer: Stores raw data as-is from the source systems. Data is ingested from CSV files into the SQL Server database.
Silver Layer: Includes data cleansing, standardization, and normalization processes to prepare data for analysis.
Gold Layer: Houses business-ready data modeled into a star schema required for reporting and analytics.
 ERP (CSV) ─┐                                                    
            ├─► Bronze (raw) ─► Silver (cleansed) ─► Gold (star schema) ─► Reports / Analytics
 CRM (CSV) ─┘
📂 Repository Structure
sql-data-warehouse-project/
│
├── datasets/                # Raw datasets (ERP and CRM CSV files)
│
├── docs/                    # Project documentation and architecture diagrams
│   ├── data_architecture.png
│   ├── data_model.png
│   ├── data_catalog.md      # Dataset field descriptions and metadata
│   └── naming_conventions.md
│
├── scripts/                 # SQL scripts for ETL and transformations
│   ├── bronze/              # Load raw data
│   ├── silver/              # Clean and transform data
│   └── gold/                # Create analytical views / star schema
│
├── tests/                   # Data quality checks and test scripts
│
├── README.md                # Project overview
├── LICENSE                  # License information
└── .gitignore               # Files ignored by Git
🛠️ Tools & Technologies
SQL Server Express – database engine
SQL Server Management Studio (SSMS) – database management
Git & GitHub – version control and collaboration
Draw.io – architecture and data model diagrams
Notion (optional) – project planning
⚙️ Getting Started
Clone the repository
bash
   git clone https://github.com/<your-username>/sql-data-warehouse-project.git
   cd sql-data-warehouse-project
Set up the database – install SQL Server and SSMS, then create the database and schemas (bronze, silver, gold).
Load the data – run the scripts in scripts/bronze to import the CSV files from datasets/.
Transform the data – run the scripts in scripts/silver, then scripts/gold.
Run the analytics – query the gold-layer views to explore customer behavior, product performance, and sales trends.
✅ Data Quality

Quality checks in the tests/ folder cover:

Duplicate and null primary keys
Unwanted spaces in string fields
Data standardization and consistency
Invalid dates and date ranges
Business-rule validation (e.g. sales = quantity × price)
📊 Analytics Highlights
Customer Behavior – segmentation, demographics, and purchasing patterns
Product Performance – best/worst sellers, category contribution, and revenue
Sales Trends – monthly/yearly growth, running totals, and moving averages
🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to open an issue or submit a pull request.

🛡️ License

This project is licensed under the MIT License. You are free to use, modify, and share this project with proper attribution.

🌟 About Me

Hi there! I'm Jhonas Sotero, a data professional passionate about data engineering and analytics.

https://www.linkedin.com/in/jhonas-sotero/
