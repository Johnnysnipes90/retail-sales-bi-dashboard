SELECT
    discount_band,
    COUNT(order_id) AS orders,
    SUM(sales) AS revenue,
    SUM(profit) AS profit,
    AVG(profit_margin) AS avg_margin
FROM fact_sales
GROUP BY discount_band
ORDER BY revenue DESC;