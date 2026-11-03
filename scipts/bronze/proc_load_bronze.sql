/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    Loads raw data from the external CSV files into the 'bronze' schema
    tables of the DataWarehouse database.

    For each table it:
      1. Truncates the table (full refresh, so reruns don't duplicate rows).
      2. Bulk inserts the data from the CSV file (header row skipped).
      3. Prints how long the load took.

Source Files:
    CRM: cust_info.csv, prd_info.csv, sales_details.csv
    ERP: CUST_AZ12.csv, LOC_A101.csv, PX_CAT_G1V2.csv
    Location: C:\Users\Superman\Desktop\dwh_project\

Parameters:
    None. The procedure takes no input and returns no values.

Notes:
    - Run in the DataWarehouse database (not master).
    - The SQL Server service account must have read access to the CSV paths.
    - Existing data in the bronze tables is deleted on every run.
    - Errors are caught and printed (message, number, state).

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	-- Variables for timing each table load and the whole batch
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;

	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT '===============================================';
		PRINT 'LOADING BRONZE LAYER';
		PRINT '===============================================';

		-----------------------------------------------------------------------
		-- CRM source tables
		-----------------------------------------------------------------------
		PRINT '===============================================';
		PRINT 'LOADING CRM TABLES';
		PRINT '===============================================';

		-- CRM: customer information
		SET @start_time = GETDATE();
		PRINT '>> TRUNCATING TABLE: bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;

		PRINT '>> INSERTING DATA INTO: bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\Superman\Desktop\dwh_project\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,            -- skip the header row
			FIELDTERMINATOR = ',',   -- CSV delimiter
			TABLOCK                  -- table lock for faster bulk loading
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------------------------------------------';

		-- CRM: product information
		SET @start_time = GETDATE();
		PRINT '>> TRUNCATING TABLE: bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info;

		PRINT '>> INSERTING DATA INTO: bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\Superman\Desktop\dwh_project\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------------------------------------------';

		-- CRM: sales details
		SET @start_time = GETDATE();
		PRINT '>> TRUNCATING TABLE: bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;

		PRINT '>> INSERTING DATA INTO: bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\Superman\Desktop\dwh_project\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------------------------------------------';

		-----------------------------------------------------------------------
		-- ERP source tables
		-----------------------------------------------------------------------
		PRINT '===============================================';
		PRINT 'LOADING ERP TABLES';
		PRINT '===============================================';

		-- ERP: customer demographics
		SET @start_time = GETDATE();
		PRINT '>> TRUNCATING TABLE: bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12;

		PRINT '>> INSERTING DATA INTO: bronze.erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\Superman\Desktop\dwh_project\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------------------------------------------';

		-- ERP: customer locations
		SET @start_time = GETDATE();
		PRINT '>> TRUNCATING TABLE: bronze.erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101;

		PRINT '>> INSERTING DATA INTO: bronze.erp_loc_a101';
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\Superman\Desktop\dwh_project\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------------------------------------------';

		-- ERP: product categories
		SET @start_time = GETDATE();
		PRINT '>> TRUNCATING TABLE: bronze.erp_px_cat_g1v2';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		PRINT '>> INSERTING DATA INTO: bronze.erp_px_cat_g1v2';
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\Superman\Desktop\dwh_project\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------------------------------------------';

		-- Total time for the whole bronze load
		SET @batch_end_time = GETDATE();
		PRINT '===============================================';
		PRINT 'BRONZE LAYER LOAD COMPLETED';
		PRINT '>> Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT '===============================================';
	END TRY

	-- Runs if any statement inside TRY fails
	BEGIN CATCH
		PRINT '===============================================';
		PRINT 'ERROR OCCURRED DURING LOADING BRONZE LAYER';
		PRINT 'Error Message: ' + ERROR_MESSAGE();
		PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error State: ' + CAST(ERROR_STATE() AS NVARCHAR);
		PRINT '===============================================';
	END CATCH
END
GO

-- Run the procedure
EXEC bronze.load_bronze;
