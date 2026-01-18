CREATE OR REPLACE VIEW vw_customer_orders_with_cohort AS
SELECT
    f.customer_key,
    f.order_date,
    DATE_TRUNC('month', f.order_date) AS order_month,
    c.cohort_month
FROM fact_sales_bi f
JOIN vw_customer_first_purchase c
  ON f.customer_key = c.customer_key;