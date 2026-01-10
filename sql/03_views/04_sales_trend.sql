CREATE OR REPLACE VIEW vw_monthly_sales AS
SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    AVG(profit_margin) AS avg_margin
FROM fact_sales
GROUP BY month
ORDER BY month;