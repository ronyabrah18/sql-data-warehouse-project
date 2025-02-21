/*
==============================================================================
Create Database and Schemas
==============================================================================

Script Purpose:
    This Script creates a new database named DataWarehouse after checking it its already exists.
    If the database exists, it is dropped and recreated. Additionaly the scirpt sets up three schemas
    within the database. Named "bronze", "silver" and "gold"

Warning:
    Running this script will drop the entire "DataWarehouse" database if it exists.
    All data in the database will be permanently deleted. Proceed with caution
    and ensure you have proper backups befoe running the script

*/

USE master;
GO 
--Drop and recreate the 'DataWarehouse' database
--SINGLE_USER mode ensures that only one session (user) can access the database. This is required before dropping a database that is currently in use.
-- WITH ROLLBACK IMMEDIATE forces any current transactions to be rolled back and immediately disconnects all users.
IF EXISTS(SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

--Create the 'DataWarehouse' database

CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- create schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
