BEGIN;

-- USERS (100k)
INSERT INTO users (full_name, email, country, created_at)
SELECT
    'User ' || gs,
    'user' || gs || '@example.com',
    (
        ARRAY[
            'Germany',
            'France',
            'Spain',
            'Italy',
            'Netherlands',
            'Serbia',
            'Sweden',
            'Austria'
        ]
    )[1 + floor(random() * 8)::int],
    NOW() - (random() * INTERVAL '730 days')
FROM generate_series(1, 100000) gs;

-- PRODUCTS (10k)
INSERT INTO products (name, category, price, stock, created_at)
SELECT
    'Product ' || gs,
    (
        ARRAY[
            'Electronics',
            'Books',
            'Clothing',
            'Home',
            'Sports',
            'Beauty'
        ]
    )[1 + floor(random() * 6)::int],
    round((10 + random() * 990)::numeric, 2),
    floor(random() * 500)::int,
    NOW() - (random() * INTERVAL '365 days')
FROM generate_series(1, 10000) gs;

-- ORDERS (1M)
INSERT INTO orders (user_id, product_id, status, quantity, total_amount, created_at)
SELECT
    floor(1 + random() * 99999)::bigint AS user_id,
    p.id AS product_id,
    (
        ARRAY['pending', 'completed', 'cancelled', 'shipped']
    )[1 + floor(random() * 4)::int] AS status,
    q.qty,
    round((p.price * q.qty)::numeric, 2),
    NOW() - (random() * INTERVAL '365 days')
FROM generate_series(1, 1000000) gs
JOIN LATERAL (
    SELECT
        floor(1 + random() * 10000)::bigint AS product_id,
        floor(1 + random() * 5)::int AS qty
) q ON true
JOIN products p ON p.id = q.product_id;

COMMIT;