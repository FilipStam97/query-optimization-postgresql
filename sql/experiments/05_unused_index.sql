--########### PostgreSQL ne koristi indeks samo zato što postoji
CREATE INDEX idx_orders_status
ON orders(status);

ANALYZE orders;

-- ########
EXPLAIN ANALYZE
SELECT *
FROM orders
WHERE status = 'REFUNDED';

---#############
EXPLAIN ANALYZE
SELECT *
FROM orders
WHERE status = 'COMPLETED';

---###Iako isti indeks postoji u oba slučaja, planner može izabrati različite strategije zato što je selektivnost potpuno drugačija