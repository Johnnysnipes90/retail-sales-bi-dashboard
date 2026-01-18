CREATE OR REPLACE VIEW vw_cohort_retention AS
SELECT
    cohort_month,
    order_month,
    COUNT(DISTINCT customer_key) AS active_customers,
    EXTRACT(MONTH FROM AGE(order_month, cohort_month)) AS months_since_first_purchase
FROM vw_customer_orders_with_cohort
GROUP BY cohort_month, order_month
ORDER BY cohort_month, order_month;