SELECT
    customer_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS orders,
    AVG(discount) AS avg_discount
FROM fact_sales
GROUP BY customer_name;