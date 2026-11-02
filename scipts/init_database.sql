/*
=============================================================
Create Database and Schemas
=============================================================
Purpose:
    Creates a fresh 'DataWarehouse' database, dropping any existing
    one first, then sets up three schemas for a medallion architecture:
      - bronze: raw data, loaded as-is from source systems
      - silver: cleaned and standardized data
      - gold:   business-ready data (reporting, analytics)

WARNING:
    Running this script permanently deletes the existing
    'DataWarehouse' database and all its data. Make sure you have
    a backup before running it.
*/

-- Switch to master, since you can't drop a database you're connected to
USE master;
GO

-- Drop the database if it already exists, so the script can be re-run safely
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    -- Force single-user mode and roll back open transactions,
    -- so active connections don't block the DROP
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the fresh database
CREATE DATABASE DataWarehouse;
GO

-- Switch into the new database so the schemas are created in it
USE DataWarehouse;
GO

-- Bronze layer: raw, unprocessed data from source systems
CREATE SCHEMA bronze;
GO

-- Silver layer: cleaned, validated, and standardized data
CREATE SCHEMA silver;
GO

-- Gold layer: aggregated, business-ready data for analytics and reporting
CREATE SCHEMA gold;
GO
