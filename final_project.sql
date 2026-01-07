----- Query 1 -----
-- How many items are usually purchased in an order?
SELECT items_purchased, COUNT(order_id) AS frequency
FROM orders
GROUP BY items_purchased
ORDER BY frequency DESC;

----- Query 2 -----
-- What items are most frequently refunded?
SELECT p.product_name, oi.product_id, COUNT(oir.order_item_refund_id) as frequency
FROM order_item_refunds oir
	INNER JOIN order_items oi ON oir.order_item_id = oi.order_item_id
	INNER JOIN products p ON oi.product_id = p.product_id
GROUP BY oi.product_id
ORDER BY frequency DESC;

----- Query 3 -----
-- What is the profit made on each item sold?
SELECT p.product_name, p.product_id, oi.price_usd, oi.cogs_usd, (oi.price_usd - oi.cogs_usd) AS profit_usd
FROM order_items oi
	INNER JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id;

----- Query 4 -----
-- What months have the highest revenue?
SELECT STRFTIME('%Y', (datetime(created_at))) AS year, 
	STRFTIME('%m', (datetime(created_at))) AS month, 
	SUM(price_usd) AS revenue_per_month
FROM orders o
GROUP BY STRFTIME('%Y', (datetime(created_at))), STRFTIME('%m', (datetime(created_at)))
ORDER BY revenue_per_month DESC;

----- Query 5 -----
-- What percentage of total orders are refunded?
WITH orders_refunded AS (
	SELECT COUNT(order_item_refund_id) AS count_refunded
	FROM order_item_refunds
)
SELECT (SELECT count_refunded FROM orders_refunded) * 1.0 / COUNT(order_id) * 100 AS percent_refunded
FROM orders;
