EXPLAIN (ANALYZE)
SELECT o.*
FROM orders o
JOIN users u ON o.user_id = u.id
WHERE u.country = 'Germany';
