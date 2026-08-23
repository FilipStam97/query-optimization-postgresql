--#################### običan indeks vs composite indeks

EXPLAIN ANALYZE
SELECT *
FROM orders
WHERE customer_id = 52731
AND created_at >= TIMESTAMP '2025-01-01';

--#########################
CREATE INDEX idx_orders_customer_created
ON orders(customer_id, created_at);

--#########
ANALYZE orders;

---##############################
EXPLAIN ANALYZE
SELECT *
FROM orders
WHERE customer_id = 52731
AND created_at >= TIMESTAMP '2025-01-01';