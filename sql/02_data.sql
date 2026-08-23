INSERT INTO customers (
    name,
    email,
    country,
    created_at
)
SELECT
    'Customer ' || i,
    'customer' || i || '@example.com',

    CASE
        WHEN r < 0.40 THEN 'Serbia'
        WHEN r < 0.65 THEN 'Germany'
        WHEN r < 0.80 THEN 'France'
        WHEN r < 0.92 THEN 'Spain'
        ELSE 'Italy'
    END,

    CURRENT_TIMESTAMP
        - random() * INTERVAL '5 years'

FROM (
    SELECT
        i,
        random() AS r
    FROM generate_series(1, 100000) AS i
) data;

-- ####################################################

INSERT INTO products (
    name,
    category,
    price
)
SELECT
    'Product ' || i,

    (ARRAY[
        'Electronics',
        'Clothing',
        'Books',
        'Sports',
        'Home'
    ])[1 + floor(random() * 5)::int],

    round(
        (10 + random() * 990)::numeric,
        2
    )

FROM generate_series(1, 20000) AS i;

-- ####################################################

INSERT INTO orders (
    customer_id,
    status,
    total,
    created_at
)
SELECT
    1 + floor(random() * 100000)::bigint,

    CASE
        WHEN r < 0.70 THEN 'COMPLETED'
        WHEN r < 0.90 THEN 'PROCESSING'
        WHEN r < 0.98 THEN 'CANCELLED'
        ELSE 'REFUNDED'
    END,

    round(
        (20 + random() * 1980)::numeric,
        2
    ),

    TIMESTAMP '2022-01-01'
        + random() *
          (TIMESTAMP '2026-08-01' - TIMESTAMP '2022-01-01')

FROM (
    SELECT random() AS r
    FROM generate_series(1, 1000000)
) data;

-- ####################################################

INSERT INTO order_items (
    order_id,
    product_id,
    quantity,
    price
)
SELECT
    1 + floor(random() * 1000000)::bigint,
    1 + floor(random() * 20000)::bigint,
    1 + floor(random() * 5)::int,
    round(
        (5 + random() * 500)::numeric,
        2
    )
FROM generate_series(1, 2000000);

-- ####################################################
ANALYZE;
