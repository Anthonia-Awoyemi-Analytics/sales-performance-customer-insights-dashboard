-- =====================================================
-- 05_business_analysis.sql
-- Purpose:
-- Final business-facing queries used to support dashboard insights,
-- recommendations, and portfolio case study findings.
-- =====================================================

-- Product category revenue contribution
SELECT
    product_type,
    SUM(amount) AS total_revenue,
    SUM(quantity) AS total_quantity
FROM rope_sales_clean
GROUP BY product_type
ORDER BY total_revenue DESC;

-- Product-level quantity vs revenue
SELECT
    product_clean,
    product_type,
    SUM(quantity) AS total_quantity,
    SUM(amount) AS total_revenue
FROM rope_sales_clean
GROUP BY product_clean, product_type
ORDER BY total_revenue DESC;

-- Customer quantity vs revenue
SELECT
    customer_name,
    SUM(quantity) AS total_quantity,
    SUM(amount) AS total_revenue
FROM rope_sales_clean
GROUP BY customer_name
ORDER BY total_revenue DESC;

-- Customer revenue share
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

-- Top 10 customers by quantity
SELECT
    customer_name,
    SUM(quantity) AS total_quantity
FROM rope_sales_clean
GROUP BY customer_name
ORDER BY total_quantity DESC
LIMIT 10;

-- Top 10 customers by revenue
SELECT
    customer_name,
    SUM(amount) AS total_revenue
FROM rope_sales_clean
GROUP BY customer_name
ORDER BY total_revenue DESC
LIMIT 10;

-- Top 10 products by quantity
SELECT
    product_clean,
    SUM(quantity) AS total_quantity
FROM rope_sales_clean
GROUP BY product_clean
ORDER BY total_quantity DESC
LIMIT 10;

-- Top 10 products by revenue
SELECT
    product_clean,
    SUM(amount) AS total_revenue
FROM rope_sales_clean
GROUP BY product_clean
ORDER BY total_revenue DESC
LIMIT 10;

-- Monthly sales performance
SELECT
    DATE_TRUNC('month', sales_date)::date AS month,
    SUM(amount) AS total_revenue,
    SUM(quantity) AS total_quantity
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

-- Product type performance by year
SELECT
    EXTRACT(YEAR FROM sales_date) AS sales_year,
    product_type,
    SUM(amount) AS total_revenue,
    SUM(quantity) AS total_quantity
FROM rope_sales_clean
GROUP BY
    EXTRACT(YEAR FROM sales_date),
    product_type
ORDER BY sales_year, total_revenue DESC;

-- Customer value segmentation
SELECT
    customer_name,
    SUM(amount) AS total_revenue,
    SUM(quantity) AS total_quantity,
    CASE
        WHEN SUM(amount) >= 10000000 THEN 'High-value customer'
        WHEN SUM(amount) >= 1000000 THEN 'Mid-value customer'
        ELSE 'Low-value customer'
    END AS customer_segment
FROM rope_sales_clean
GROUP BY customer_name
ORDER BY total_revenue DESC;

-- Customer segment summary
WITH customer_totals AS (
    SELECT
        customer_name,
        SUM(amount) AS total_revenue,
        SUM(quantity) AS total_quantity
    FROM rope_sales_clean
    GROUP BY customer_name
)
SELECT
    CASE
        WHEN total_revenue >= 10000000 THEN 'High-value customers'
        WHEN total_revenue >= 1000000 THEN 'Mid-value customers'
        ELSE 'Low-value customers'
    END AS customer_segment,
    COUNT(*) AS customer_count,
    SUM(total_revenue) AS segment_revenue,
    SUM(total_quantity) AS segment_quantity
FROM customer_totals
GROUP BY customer_segment
ORDER BY segment_revenue DESC;