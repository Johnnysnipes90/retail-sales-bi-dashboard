SELECT
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    AVG(profit_margin) AS avg_profit_margin,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_name) AS total_customers,
    AVG(shipping_days) AS avg_shipping_days
FROM fact_sales;