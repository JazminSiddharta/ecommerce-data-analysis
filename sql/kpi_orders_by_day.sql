SELECT 
    EXTRACT(DOW FROM order_purchase_timestamp) AS day_of_week,
    COUNT(*) AS total_orders
FROM orders
GROUP BY day_of_week
ORDER BY total_orders DESC;