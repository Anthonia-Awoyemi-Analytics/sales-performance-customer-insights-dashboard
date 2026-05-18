-- =====================================================
-- 03_exploratory_analysis.sql
-- Purpose:
-- Early exploratory analysis used to understand product performance,
-- customer behavior, revenue trends, and sales distribution before dashboarding.
-- =====================================================

-- Total revenue and quantity
SELECT
    SUM(amount) AS total_revenue,
    SUM(quantity) AS total_quantity
FROM rope_sales_clean;

-- Number of unique customers and products
SELECT
    COUNT(DISTINCT customer_name) AS total_customers,
    COUNT(DISTINCT product_clean) AS total_products,
    COUNT(DISTINCT product_type) AS total_product_types
FROM rope_sales_clean;

-- Top products by quantity
SELECT
    product_clean,
    SUM(quantity) AS total_quantity
FROM rope_sales_clean
GROUP BY product_clean
ORDER BY total_quantity DESC
LIMIT 10;

-- Top products by revenue
SELECT
    product_clean,
    SUM(amount) AS total_revenue
FROM rope_sales_clean
GROUP BY product_clean
ORDER BY total_revenue DESC
LIMIT 10;

-- Top customers by quantity
SELECT
    customer_name,
    SUM(quantity) AS total_quantity
FROM rope_sales_clean
GROUP BY customer_name
ORDER BY total_quantity DESC
LIMIT 10;

-- Top customers by revenue
SELECT
    customer_name,
    SUM(amount) AS total_revenue
FROM rope_sales_clean
GROUP BY customer_name
ORDER BY total_revenue DESC
LIMIT 10;

-- Revenue by product type
SELECT
    product_type,
    SUM(amount) AS total_revenue
FROM rope_sales_clean
GROUP BY product_type
ORDER BY total_revenue DESC;

-- Monthly revenue trend
SELECT
    DATE_TRUNC('month', sales_date)::date AS month,
    SUM(amount) AS total_revenue
FROM rope_sales_clean
GROUP BY DATE_TRUNC('month', sales_date)::date
ORDER BY month;

-- Highest revenue months
SELECT
    DATE_TRUNC('month', sales_date)::date AS month,
    SUM(amount) AS total_revenue
FROM rope_sales_clean
GROUP BY DATE_TRUNC('month', sales_date)::date
ORDER BY total_revenue DESC;

-- Customers with more than 1 million revenue
SELECT
    customer_name,
    SUM(amount) AS total_revenue
FROM rope_sales_clean
GROUP BY customer_name
HAVING SUM(amount) > 1000000
ORDER BY total_revenue DESC;

-- Product types with over 10 million revenue in 2025
SELECT
    product_type,
    EXTRACT(YEAR FROM sales_date) AS sales_year,
    SUM(amount) AS total_revenue
FROM rope_sales_clean
WHERE EXTRACT(YEAR FROM sales_date) = 2025
GROUP BY
    product_type,
    EXTRACT(YEAR FROM sales_date)
HAVING SUM(amount) > 10000000
ORDER BY total_revenue DESC;