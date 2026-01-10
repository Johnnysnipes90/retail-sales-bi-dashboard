-- ===============================================================
-- Date Dimension (Continuous Calendar Table)
-- Supports Power BI Time Intelligence (YTD, YoY and the likes)
-- ===============================================================

DROP TABLE IF EXISTS dim_date;

CREATE TABLE dim_date (
    date_key        DATE PRIMARY KEY,
    year            INTEGER,
    quarter         VARCHAR(2),
    fiscal_quarter  VARCHAR(3),
    month           INTEGER,
    month_name      VARCHAR(20),
    week_of_year    INTEGER,
    day             INTEGER,
    weekday         VARCHAR(10),
    is_weekend      BOOLEAN
);

INSERT INTO dim_date
SELECT
    d::date                               AS date_key,
    EXTRACT(YEAR FROM d)::INTEGER         AS year,
    CONCAT('Q', EXTRACT(QUARTER FROM d))  AS quarter,
    CONCAT(
        'FQ',
        ((EXTRACT(MONTH FROM d) - 1) / 3 + 1)::INTEGER
    )                                     AS fiscal_quarter,
    EXTRACT(MONTH FROM d)::INTEGER        AS month,
    TRIM(TO_CHAR(d, 'Month'))             AS month_name,
    EXTRACT(WEEK FROM d)::INTEGER         AS week_of_year,
    EXTRACT(DAY FROM d)::INTEGER          AS day,
    TRIM(TO_CHAR(d, 'Day'))               AS weekday,
    CASE
        WHEN EXTRACT(DOW FROM d) IN (0, 6) THEN TRUE
        ELSE FALSE
    END                                   AS is_weekend
FROM generate_series(
    (SELECT MIN(order_date) FROM fact_sales_bi),
    (SELECT MAX(order_date) FROM fact_sales_bi),
    INTERVAL '1 day'
) d;


CREATE INDEX idx_dim_date_date_key ON dim_date(date_key);