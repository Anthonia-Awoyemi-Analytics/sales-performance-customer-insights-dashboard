-- =====================================================
-- 04_reporting_views.sql
-- Purpose:
-- Create reusable SQL views for Power BI reporting.
-- These views support the dashboard pages and keep reporting logic organized.
-- =====================================================

-- Executive KPI summary
CREATE OR REPLACE VIEW vw_executive_summary AS
SELECT
    SUM(amount) AS total_revenue,
    SUM(quantity) AS total_quantity,
    COUNT(DISTINCT customer_name) AS total_customers,
    COUNT(DISTINCT product_type) AS total_product_types,
    COUNT(DISTINCT product_clean) AS total_products
FROM rope_sales_clean;

-- Monthly revenue and quantity trend
CREATE OR REPLACE VIEW vw_monthly_revenue AS
SELECT
    DATE_TRUNC('month', sales_date)::date AS month,
    SUM(amount) AS total_revenue,
    SUM(quantity) AS total_quantity
FROM rope_sales_clean
GROUP BY DATE_TRUNC('month', sales_date)::date
ORDER BY month;

-- Product type performance
CREATE OR REPLACE VIEW vw_product_type_revenue AS
SELECT
    product_type,
    SUM(amount) AS total_revenue,
    SUM(quantity) AS total_quantity
FROM rope_sales_clean
GROUP BY product_type
ORDER BY total_revenue DESC;

-- Customer revenue and quantity summary
CREATE OR REPLACE VIEW vw_customer_revenue AS
SELECT
    customer_name,
    SUM(amount) AS total_revenue,
    SUM(quantity) AS total_quantity
FROM rope_sales_clean
GROUP BY customer_name
ORDER BY total_revenue DESC;

-- Product quantity summary
CREATE OR REPLACE VIEW vw_product_quantity AS
SELECT
    product_clean,
    SUM(quantity) AS total_quantity
FROM rope_sales_clean
GROUP BY product_clean
ORDER BY total_quantity DESC;

-- Product revenue summary
CREATE OR REPLACE VIEW vw_product_revenue AS
SELECT
    product_clean,
    SUM(amount) AS total_revenue
FROM rope_sales_clean
GROUP BY product_clean
ORDER BY total_revenue DESC;

-- Product performance for quantity vs revenue analysis
CREATE OR REPLACE VIEW vw_product_performance AS
SELECT
    product_clean,
    product_type,
    SUM(quantity) AS total_quantity,
    SUM(amount) AS total_revenue
FROM rope_sales_clean
GROUP BY product_clean, product_type;

-- Customer performance for customer analysis
CREATE OR REPLACE VIEW vw_customer_performance AS
SELECT
    customer_name,
    SUM(amount) AS total_revenue,
    SUM(quantity) AS total_quantity
FROM rope_sales_clean
GROUP BY customer_name
ORDER BY total_revenue DESC;

-- Customer revenue share
CREATE OR REPLACE VIEW vw_customer_revenue_share AS
SELECT
    customer_name,
    SUM(amount) AS total_revenue,
    ROUND(
        SUM(amount) * 100.0 / SUM(SUM(amount)) OVER (),
        2
    ) AS revenue_share_percent
FROM rope_sales_clean
GROUP BY customer_name
ORDER BY total_revenue DESC;