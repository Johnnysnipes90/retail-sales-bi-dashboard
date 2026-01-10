DROP TABLE IF EXISTS dim_product;

CREATE TABLE dim_product (
    product_key   SERIAL PRIMARY KEY,
    product_id    VARCHAR(50),
    product_name  VARCHAR(255),
    category      VARCHAR(100),
    sub_category  VARCHAR(100)
);

INSERT INTO dim_product (product_id, product_name, category, sub_category)
SELECT DISTINCT
    product_id,
    product_name,
    category,
    sub_category
FROM fact_sales;