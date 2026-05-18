-- =====================================================
-- 01_data_preparation.sql
-- Purpose:
-- Excel was used for the initial cleaning and standardization.
-- The cleaned CSV was imported into PostgreSQL as text first
-- to avoid import errors from dates, blanks, currency values, and mixed formats.
-- This script converts the imported text table into a properly typed analysis table.
-- =====================================================

DROP TABLE IF EXISTS rope_sales_clean;

CREATE TABLE rope_sales_clean AS
SELECT
    TRIM(waybill_no) AS waybill_no,
    TO_DATE(NULLIF(TRIM(sales_date), ''), 'YYYY-MM-DD') AS sales_date,

    NULLIF(TRIM(customer_name), '') AS customer_name,
    NULLIF(TRIM(product_name), '') AS product_name,
    NULLIF(TRIM(product_clean), '') AS product_clean,
    NULLIF(TRIM(product_type), '') AS product_type,
    NULLIF(TRIM(unit), '') AS unit,
    NULLIF(TRIM(by_200), '') AS by_200,
    NULLIF(TRIM(material), '') AS material,
    NULLIF(TRIM(driver_name), '') AS driver_name,

    CAST(NULLIF(TRIM(size_mm), '') AS NUMERIC) AS size_mm,
    CAST(NULLIF(TRIM(quantity), '') AS NUMERIC) AS quantity,
    CAST(NULLIF(TRIM(rate), '') AS NUMERIC) AS rate,
    CAST(NULLIF(TRIM(amount), '') AS NUMERIC) AS amount
FROM rope_sales;