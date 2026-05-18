-- =====================================================
-- 02_data_validation.sql
-- Purpose:
-- Validate the imported and typed sales data before analysis.
-- These checks helped confirm row counts, data types, missing values,
-- date coverage, and general data quality.
-- =====================================================

-- Preview cleaned table
SELECT *
FROM rope_sales_clean
LIMIT 10;

-- Check row count
SELECT COUNT(*) AS total_rows
FROM rope_sales_clean;

-- Check column data types
SELECT
    column_name,
    data_type
FROM information_schema.columns
WHERE table_name = 'rope_sales_clean'
ORDER BY ordinal_position;

-- Check date range
SELECT
    MIN(sales_date) AS earliest_date,
    MAX(sales_date) AS latest_date
FROM rope_sales_clean;

-- Check records by year and month
SELECT
    EXTRACT(YEAR FROM sales_date) AS sales_year,
    EXTRACT(MONTH FROM sales_date) AS sales_month,
    COUNT(*) AS transaction_count,
    SUM(amount) AS total_revenue
FROM rope_sales_clean
GROUP BY
    EXTRACT(YEAR FROM sales_date),
    EXTRACT(MONTH FROM sales_date)
ORDER BY sales_year, sales_month;

-- Check missing values in key fields
SELECT
    COUNT(*) FILTER (WHERE sales_date IS NULL) AS missing_sales_date,
    COUNT(*) FILTER (WHERE customer_name IS NULL) AS missing_customer_name,
    COUNT(*) FILTER (WHERE product_clean IS NULL) AS missing_product_clean,
    COUNT(*) FILTER (WHERE quantity IS NULL) AS missing_quantity,
    COUNT(*) FILTER (WHERE rate IS NULL) AS missing_rate,
    COUNT(*) FILTER (WHERE amount IS NULL) AS missing_amount
FROM rope_sales_clean;

-- Check for duplicate waybill numbers
SELECT
    waybill_no,
    COUNT(*) AS occurrence_count
FROM rope_sales_clean
GROUP BY waybill_no
HAVING COUNT(*) > 1
ORDER BY occurrence_count DESC;

-- Check negative or zero values
SELECT *
FROM rope_sales_clean
WHERE quantity < 0
   OR rate < 0
   OR amount < 0;

-- Check blank/unknown customer names
SELECT *
FROM rope_sales_clean
WHERE customer_name IS NULL
   OR LOWER(customer_name) IN ('blank', 'unknown', 'n/a');