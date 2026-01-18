-- “When did each customer start doing business with us?”
CREATE OR REPLACE VIEW vw_customer_first_purchase AS
SELECT
    customer_key,
    MIN(order_date) AS first_purchase_date,
    DATE_TRUNC('month', MIN(order_date)) AS cohort_month
FROM fact_sales_bi
GROUP BY customer_key;