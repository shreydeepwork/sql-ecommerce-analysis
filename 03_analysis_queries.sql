-- ============================================
-- E-Commerce Sales Analysis
-- File 3: Analytical Queries
-- ============================================

USE shop;

-- ============================================
-- BASIC QUERIES
-- ============================================

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

-- ============================================
-- ADVANCED QUERIES
-- ============================================

-- Query 7: UNION - List all unique cities from customers and orders
SELECT c.city AS location, 'Customer' AS source
FROM customers c
UNION
SELECT c.city AS location, 'Order' AS source
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

-- Query 8: ROLLUP - Revenue by city and category with subtotals
SELECT c.city,
       p.category,
       SUM(oi.quantity * p.price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_status = 'Delivered'
GROUP BY c.city, p.category WITH ROLLUP;

-- ============================================
-- STORED PROCEDURE
-- ============================================

-- Procedure 9: Get all orders for a specific city
DROP PROCEDURE IF EXISTS get_orders_by_city;

DELIMITER \\

CREATE PROCEDURE get_orders_by_city(IN city_name VARCHAR(50))
BEGIN
    SELECT o.order_id, c.name, o.order_date, o.order_status
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
    WHERE c.city = city_name;
END\\

DELIMITER ;

-- Call the procedure (uncomment to test)
-- CALL get_orders_by_city('Delhi');

-- ============================================
-- TRIGGER
-- ============================================

-- Create a log table for cancellations
CREATE TABLE IF NOT EXISTS order_cancellations (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    cancelled_on DATETIME,
    reason VARCHAR(255)
);

-- Trigger 10: Log order cancellations automatically
DROP TRIGGER IF EXISTS trg_log_order_cancel;

DELIMITER \\

CREATE TRIGGER trg_log_order_cancel
AFTER UPDATE ON orders
FOR EACH ROW
BEGIN
    IF NEW.order_status = 'Cancelled'
    AND OLD.order_status <> 'Cancelled' THEN
        INSERT INTO order_cancellations (order_id, cancelled_on, reason)
        VALUES (NEW.order_id, NOW(), 'Order cancelled by user');
    END IF;
END\\

DELIMITER ;
