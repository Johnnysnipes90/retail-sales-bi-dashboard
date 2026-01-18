CREATE TABLE dim_ship_mode (
    ship_mode_key  SERIAL PRIMARY KEY,
    ship_mode      VARCHAR(50),
    order_priority VARCHAR(50)
);

INSERT INTO dim_ship_mode (ship_mode, order_priority)
SELECT DISTINCT
    ship_mode,
    order_priority
FROM fact_sales;