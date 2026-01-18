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
    gs::date                               AS date_key,
    EXTRACT(YEAR FROM gs)::INTEGER         AS year,
    CONCAT('Q', EXTRACT(QUARTER FROM gs))  AS quarter,
    CONCAT(
        'FQ',
        ((EXTRACT(MONTH FROM gs) - 1) / 3 + 1)::INTEGER
    )                                     AS fiscal_quarter,
    EXTRACT(MONTH FROM gs)::INTEGER        AS month,
    TRIM(TO_CHAR(gs, 'Month'))             AS month_name,
    EXTRACT(WEEK FROM gs)::INTEGER         AS week_of_year,
    EXTRACT(DAY FROM gs)::INTEGER          AS day,
    TRIM(TO_CHAR(gs, 'Day'))               AS weekday,
    CASE
        WHEN EXTRACT(DOW FROM gs) IN (0, 6) THEN TRUE
        ELSE FALSE
    END                                   AS is_weekend
FROM generate_series(
    (SELECT MIN(order_date) FROM fact_sales),
    (SELECT MAX(order_date) FROM fact_sales),
    INTERVAL '1 day'
) AS gs;

CREATE INDEX idx_dim_date_date_key ON dim_date(date_key);