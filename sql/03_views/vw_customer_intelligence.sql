CREATE OR REPLACE VIEW vw_customer_intelligence AS
SELECT
    c.customer_name,
    c.country,
    SUM(f.sales) AS total_sales,
    SUM(f.profit) AS total_profit,
    COUNT(DISTINCT f.order_id) AS orders,
    AVG(f.discount) AS avg_discount
FROM fact_sales_bi f
JOIN dim_customer c
  ON f.customer_key = c.customer_key
JOIN dim_date d
  ON f.order_date = d.date_key
GROUP BY
    c.customer_name,
    c.country
ORDER BY total_sales DESC;