DROP TABLE IF EXISTS fact_sales_bi;

-- Then recreate fact_sales_bi
CREATE TABLE fact_sales_bi (
    fact_id         SERIAL PRIMARY KEY,
    order_id        VARCHAR(50),
    order_date      DATE,
    ship_date       DATE,

    customer_key    INTEGER,
    product_key     INTEGER,
    ship_mode_key   INTEGER,

    sales           NUMERIC(12,2),
    quantity        INTEGER,
    discount        NUMERIC(5,2),
    profit          NUMERIC(12,2),
    shipping_cost   NUMERIC(12,2),
    shipping_days   INTEGER,
    profit_margin   NUMERIC(8,4),
    discount_band   VARCHAR(50)
);

-- Populate fact_sales_bi
INSERT INTO fact_sales_bi (
    order_id,
    order_date,
    ship_date,
    customer_key,
    product_key,
    ship_mode_key,
    sales,
    quantity,
    discount,
    profit,
    shipping_cost,
    shipping_days,
    profit_margin,
    discount_band
)
SELECT
    f.order_id,
    f.order_date,
    f.ship_date,
    c.customer_key,
    p.product_key,
    s.ship_mode_key,
    f.sales,
    f.quantity,
    f.discount,
    f.profit,
    f.shipping_cost,
    f.shipping_days,
    f.profit_margin,
    f.discount_band
FROM fact_sales f
JOIN dim_customer c
  ON f.customer_name = c.customer_name
 AND f.segment = c.segment
 AND f.state = c.state
 AND f.region = c.region
 AND f.market = c.market
 AND f.country = c.country
JOIN dim_product p
  ON f.product_id = p.product_id
 AND f.product_name = p.product_name
JOIN dim_ship_mode s
  ON f.ship_mode = s.ship_mode
 AND f.order_priority = s.order_priority;

-- Add foreign keys and indexes as before
ALTER TABLE fact_sales_bi
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_key) REFERENCES dim_customer(customer_key);

ALTER TABLE fact_sales_bi
ADD CONSTRAINT fk_product
FOREIGN KEY (product_key) REFERENCES dim_product(product_key);

ALTER TABLE fact_sales_bi
ADD CONSTRAINT fk_ship
FOREIGN KEY (ship_mode_key) REFERENCES dim_ship_mode(ship_mode_key);

CREATE INDEX idx_fact_sales_bi_date ON fact_sales_bi(order_date);
CREATE INDEX idx_fact_sales_bi_customer ON fact_sales_bi(customer_key);
CREATE INDEX idx_fact_sales_bi_product ON fact_sales_bi(product_key);