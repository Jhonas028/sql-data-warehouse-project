/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    Creates the tables in the 'bronze' schema of the DataWarehouse database.
    Each table mirrors the structure of a raw source file (CRM and ERP), so
    data can be loaded as-is, with no cleaning or transformation.

    If a table already exists, it is dropped and recreated.

Tables Created:
    CRM source:
        bronze.crm_cust_info      - customer information
        bronze.crm_prd_info       - product information
        bronze.crm_sales_details  - sales transactions
    ERP source:
        bronze.erp_loc_a101       - customer country/location
        bronze.erp_cust_az12      - customer birthdate and gender
        bronze.erp_px_cat_g1v2    - product categories

Notes:
    - Run in the DataWarehouse database (not master).
    - The 'bronze' schema must already exist.
    - WARNING: running this script deletes any data already in these tables.
      Reload afterwards with: EXEC bronze.load_bronze;
    - Column order must match the column order of the source CSV files,
      because BULK INSERT maps columns by position.
===============================================================================
*/

-- CRM: customer information
IF OBJECT_ID ('bronze.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_cust_info;
CREATE TABLE bronze.crm_cust_info (
    cst_id              INT,            -- customer ID
    cst_key             NVARCHAR(50),   -- customer key (business key)
    cst_firstname       NVARCHAR(50),
    cst_lastname        NVARCHAR(50),
    cst_material_status NVARCHAR(50),   -- marital status
    cst_gndr            NVARCHAR(50),   -- gender
    cst_create_date     DATE            -- date the customer record was created
);

-- CRM: product information
IF OBJECT_ID ('bronze.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_prd_info;
CREATE TABLE bronze.crm_prd_info (
    prd_id       INT,                   -- product ID
    prd_key      NVARCHAR(50),          -- product key (business key)
    prd_nm       NVARCHAR(50),          -- product name
    prd_cost     INT,
    prd_line     NVARCHAR(50),          -- product line
    prd_start_dt DATETIME,              -- start of validity period
    prd_end_dt   DATETIME               -- end of validity period
);

-- CRM: sales details
IF OBJECT_ID ('bronze.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE bronze.crm_sales_details;
CREATE TABLE bronze.crm_sales_details (
    sls_ord_num  NVARCHAR(50),          -- order number
    sls_prd_key  NVARCHAR(50),          -- product key
    sls_cust_id  INT,                   -- customer ID
    sls_order_dt INT,                   -- order date (raw integer, e.g. yyyymmdd)
    sls_ship_dt  INT,                   -- ship date (raw integer)
    sls_due_dt   INT,                   -- due date (raw integer)
    sls_sales    INT,                   -- total sales amount
    sls_quantity INT,
    sls_price    INT                    -- unit price
);

-- ERP: customer location
IF OBJECT_ID ('bronze.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE bronze.erp_loc_a101;
CREATE TABLE bronze.erp_loc_a101 (
    cid   NVARCHAR(50),                 -- customer ID
    cntry NVARCHAR(50)                  -- country
);

-- ERP: customer birthdate and gender
IF OBJECT_ID ('bronze.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE bronze.erp_cust_az12;
CREATE TABLE bronze.erp_cust_az12 (
    cid   NVARCHAR(50),                 -- customer ID
    bdate DATE,                         -- birthdate
    gen   NVARCHAR(50)                  -- gender
);

-- ERP: product categories
IF OBJECT_ID ('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE bronze.erp_px_cat_g1v2;
CREATE TABLE bronze.erp_px_cat_g1v2 (
    id          NVARCHAR(50),           -- product category ID
    cat         NVARCHAR(50),           -- category
    subcat      NVARCHAR(50),           -- subcategory
    maintenance NVARCHAR(50)            -- maintenance flag
);
