SELECT 
    AVG(order_total) AS avg_ticket
FROM (
    SELECT 
        order_id,
        SUM(price) AS order_total
    FROM order_items
    GROUP BY order_id
) sub;