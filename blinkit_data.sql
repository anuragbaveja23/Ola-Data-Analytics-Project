-- Database: Blinkit_DB

-- DROP DATABASE IF EXISTS "Blinkit_DB";

CREATE DATABASE "Blinkit_DB"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- Created Table -- 	

CREATE TABLE blinkit_data (
  "Item_Fat_Content"           TEXT,
  "Item_Identifier"            TEXT,
  "Item_Type"                  TEXT,
  "Outlet_Establishment_Year"  INTEGER,
  "Outlet_Identifier"          TEXT,
  "Outlet_Location_Type"       TEXT,
  "Outlet_Size"                TEXT,
  "Outlet_Type"                TEXT,
  "Item_Visibility"            DOUBLE PRECISION,
  "Item_Weight"                DOUBLE PRECISION,
  "Sales"                      DOUBLE PRECISION,
  "Rating"                     DOUBLE PRECISION
);

-- Imported csv file using Postgre SQL UI--

-- Showing the imported data --
SELECT * FROM blinkit_data LIMIT 5

-- checking count --
SELECT COUNT(*)
FROM blinkit_data

-- updation --
UPDATE blinkit_data
SET "Item_Fat_Content" = 
CASE
WHEN "Item_Fat_Content" IN ('LF','low fat') THEN 'Low Fat'
WHEN "Item_Fat_Content" ='reg' THEN 'Regular'
ELSE "Item_Fat_Content"
END;

-- verifying updation --
SELECT DISTINCT "Item_Fat_Content" FROM blinkit_data


-- KPI Requirements --

-- Total Sales --
CREATE VIEW total_sales_in_MN AS
SELECT CAST(SUM("Sales")/1000000 AS DECIMAL(10,3)) AS total_sales_in_MN
FROM blinkit_data

SELECT * FROM total_sales_in_MN

-- Average Sale --
SELECT CAST(AVG("Sales") AS DECIMAL(10,2))
FROM blinkit_data

-- Total Number of Items Sold --
SELECT COUNT(*)
FROM blinkit_data

-- Average Rating --
SELECT CAST(AVG("Rating") AS DECIMAL(10,2)) FROM blinkit_data

-- Total Sales by Fat Content --
SELECT "Item_Fat_Content", CAST(SUM("Sales")/1000000 AS DECIMAL(10,2)) AS Sales_in_mn
FROM blinkit_data
GROUP BY "Item_Fat_Content"

-- Average Sale by Fat Content --
SELECT "Item_Fat_Content", CAST(AVG("Sales") AS DECIMAL(10,2)) AS avg_sales
FROM blinkit_data
GROUP BY "Item_Fat_Content"

-- Total Number of Items Sold by Fat Content --
SELECT "Item_Fat_Content", COUNT(*)
FROM blinkit_data
GROUP BY "Item_Fat_Content"

-- Average Rating by Fat Content--
SELECT "Item_Fat_Content", CAST(AVG("Rating") AS DECIMAL(10,2)) 
FROM blinkit_data
GROUP BY "Item_Fat_Content"


-- Total Sales by Item Type --
SELECT "Item_Type", CAST(SUM("Sales")/1000000 AS DECIMAL(10,2)) AS Sales_in_mn
FROM blinkit_data
GROUP BY "Item_Type"
ORDER BY "Item_Type"

-- Average Sale by Item Type --
SELECT "Item_Type", CAST(AVG("Sales") AS DECIMAL(10,2)) AS avg_sales
FROM blinkit_data
GROUP BY "Item_Type"

-- Total Number of Items Sold by Fat Content --
SELECT "Item_Type", COUNT(*)
FROM blinkit_data
GROUP BY "Item_Type"

-- Average Rating by Item Type --
SELECT "Item_Type", CAST(AVG("Rating") AS DECIMAL(10,2)) 
FROM blinkit_data
GROUP BY "Item_Type"

SELECT "Outlet_Identifier", "Item_Fat_Content"
FROM blinkit_data
GROUP BY "Outlet_Identifier"


