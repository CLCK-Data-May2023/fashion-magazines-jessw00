SELECT
    c.customer_name AS customer_name,
    SUM(s.price_per_month * s.subscription_length) AS total_amount_due
FROM customers AS c
JOIN orders AS o ON c.customer_id = o.customer_id
JOIN subscriptions AS s ON o.subscription_id = s.subscription_id
WHERE o.order_status = 'unpaid'
    AND s.description = 'Fashion Magazine'
GROUP BY c.customer_name;