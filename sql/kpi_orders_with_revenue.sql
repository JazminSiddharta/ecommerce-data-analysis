SELECT 
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(price) AS total_revenue
FROM order_items;