CREATE OR REPLACE VIEW vw_discount_performance AS
SELECT
    f.discount_band,
    COUNT(f.fact_id) AS orders,
    SUM(f.sales) AS revenue,
    SUM(f.profit) AS profit,
    AVG(f.profit_margin) AS avg_margin
FROM fact_sales_bi f
JOIN dim_date d
  ON f.order_date = d.date_key
GROUP BY f.discount_band
ORDER BY revenue DESC;