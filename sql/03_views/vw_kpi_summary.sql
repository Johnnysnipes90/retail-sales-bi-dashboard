CREATE OR REPLACE VIEW vw_kpi_summary AS
SELECT
    SUM(f.sales) AS total_sales,
    SUM(f.profit) AS total_profit,
    AVG(f.profit_margin) AS avg_profit_margin,
    COUNT(DISTINCT f.order_id) AS total_orders,
    COUNT(DISTINCT f.customer_key) AS total_customers,
    AVG(f.shipping_days) AS avg_shipping_days
FROM fact_sales_bi f;