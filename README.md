# query-optimization-postgresql
Query optimizations for PostgreSQL , part of advanced RDBMS masters course

### Start up the container
docker compose up -d
docker logs -f postgres-query-optimization

### Start the psql tool
docker exec -it postgres-query-optimization bash
psql -U postgres
\c optimization_db

SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_items;

EXPLAIN ANALYZE
SELECT *
FROM orders
WHERE customer_id = 52731;





