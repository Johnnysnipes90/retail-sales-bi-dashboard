CREATE TABLE dim_customer (
    customer_key  SERIAL PRIMARY KEY,
    customer_name VARCHAR(255),
    segment       VARCHAR(50),
    state         VARCHAR(100),
    region        VARCHAR(100),
    market        VARCHAR(100),
    country       VARCHAR(100)
);

INSERT INTO dim_customer (customer_name, segment, state, region, market, country)
SELECT DISTINCT
    customer_name,
    segment,
    state,
    region,
    market,
    country
FROM fact_sales;