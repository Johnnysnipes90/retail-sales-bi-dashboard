SELECT
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    AVG(profit_margin) AS avg_margin
FROM fact_sales
GROUP BY category
ORDER BY total_sales DESC;