EXPLAIN (ANALYZE)
SELECT *
FROM orders
WHERE user_id IN (
    SELECT id FROM users WHERE country = 'Germany'
);
