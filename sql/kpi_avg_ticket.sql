SELECT AVG(order_total) AS avg_ticket
FROM (
    SELECT 
        order_id,
        SUM(payment_value) AS order_total
    FROM payments
    GROUP BY order_id
) sub;