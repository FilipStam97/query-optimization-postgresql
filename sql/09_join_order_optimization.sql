EXPLAIN (ANALYZE)
SELECT *
FROM orders o
JOIN users u ON o.user_id = u.id
JOIN products p ON o.product_id = p.id
WHERE u.country = 'Germany'
AND p.category = 'Electronics';
