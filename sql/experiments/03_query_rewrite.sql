--################## loše formulisan WHERE

CREATE INDEX idx_orders_created_at
ON orders(created_at);

ANALYZE orders;

--###########################
EXPLAIN ANALYZE
SELECT *
FROM orders
WHERE DATE(created_at) = DATE '2025-05-10';

--############################
EXPLAIN ANALYZE
SELECT *
FROM orders
WHERE created_at >= TIMESTAMP '2025-05-10 00:00:00'
AND created_at < TIMESTAMP '2025-05-11 00:00:00';