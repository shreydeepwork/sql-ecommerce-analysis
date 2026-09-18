-- ============================================
-- E-Commerce Sales Analysis
-- File 3: Analytical Queries
-- ============================================

USE shop;

-- Query 1: Total Revenue
SELECT SUM(amount) AS total_revenue
FROM payments;

-- Query 2: Revenue by Product (Delivered Orders Only)
SELECT p.product_name,
       SUM(oi.quantity * p.price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_name
ORDER BY revenue DESC;

-- Query 3: Customer Spending
SELECT c.name,
       SUM(p.amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.name
ORDER BY total_spent DESC;

-- Query 4: Best-Selling Products (by Quantity)
SELECT p.product_name,
       SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

-- Query 5: Cancelled Orders Count
SELECT COUNT(*) AS cancelled_orders
FROM orders
WHERE order_status = 'Cancelled';

-- Query 6: Revenue by City
SELECT c.city,
       SUM(p.amount) AS total_sales
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.city
ORDER BY total_sales DESC;