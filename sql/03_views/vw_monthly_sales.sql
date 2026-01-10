-- vw_monthly_sales: Aggregates sales and profit per month for reporting

CREATE OR REPLACE VIEW vw_monthly_sales AS
SELECT
    d.year,
    d.month,
    d.month_name,
    SUM(f.sales) AS total_sales,
    SUM(f.profit) AS total_profit,
    AVG(f.profit_margin) AS avg_profit_margin
FROM fact_sales_bi f
JOIN dim_date d
  ON f.order_date = d.date_key
GROUP BY
    d.year,
    d.month,
    d.month_name
ORDER BY
    d.year,
    d.month;