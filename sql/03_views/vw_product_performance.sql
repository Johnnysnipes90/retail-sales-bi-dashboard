CREATE OR REPLACE VIEW vw_product_performance AS
SELECT
    p.category,
    p.sub_category,
    SUM(f.sales) AS total_sales,
    SUM(f.profit) AS total_profit,
    AVG(f.profit_margin) AS avg_margin
FROM fact_sales_bi f
JOIN dim_product p
  ON f.product_key = p.product_key
JOIN dim_date d
  ON f.order_date = d.date_key
GROUP BY
    p.category,
    p.sub_category
ORDER BY total_sales DESC;