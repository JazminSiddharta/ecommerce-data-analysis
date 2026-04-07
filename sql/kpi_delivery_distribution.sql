SELECT 
    delivery_time_days,
    COUNT(*) 
FROM orders
GROUP BY delivery_time_days
ORDER BY delivery_time_days;