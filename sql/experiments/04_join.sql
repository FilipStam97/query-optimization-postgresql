--##################### JOIN

EXPLAIN ANALYZE
SELECT
    c.id,
    c.name,
    o.id AS order_id,
    SUM(oi.quantity * oi.price) AS order_value
FROM customers c
JOIN orders o
    ON o.customer_id = c.id
JOIN order_items oi
    ON oi.order_id = o.id
WHERE c.id = 52731
GROUP BY
    c.id,
    c.name,
    o.id;

--###########################
CREATE INDEX idx_order_items_order_id
ON order_items(order_id);

ANALYZE order_items;

--############################ then repeat the first query above