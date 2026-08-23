--### Execute one by one - proveri da nema indeksa
SELECT indexname, indexdef
FROM pg_indexes
WHERE tablename = 'orders';

--#################################
EXPLAIN ANALYZE
SELECT *
FROM orders
WHERE customer_id = 52731;

--################################# create index
CREATE INDEX idx_orders_customer_id
ON orders(customer_id);

--#################################
ANALYZE orders;

--AGAIN:
EXPLAIN ANALYZE
SELECT *
FROM orders
WHERE customer_id = 52731;