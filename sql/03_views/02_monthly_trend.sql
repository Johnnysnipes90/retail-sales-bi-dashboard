SELECT
    order_id,
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    TO_CHAR(order_date, 'Month') AS order_month_name,
    CONCAT('Q', EXTRACT(QUARTER FROM order_date)) AS order_quarter
FROM fact_sales;