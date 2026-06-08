-- ========================================================
-- PROJECT: E-COMMERCE BUSINESS INTEL ANALYSIS
-- AUTHOR: Konda Sravani
-- ========================================================

-- Query 1: Top 5 highest-valued orders
SELECT order_id, total_amount 
FROM orders 
ORDER BY total_amount DESC 
LIMIT 5;

-- Query 2: Total revenue and order count by country
SELECT c.country, SUM(o.total_amount) AS total_revenue, COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.country;

-- Query 3: Orders above the average order value
SELECT * 
FROM orders 
WHERE total_amount > (
    SELECT AVG(total_amount) 
    FROM orders
);

-- Query 4: Orders containing Electronics category items
SELECT * 
FROM orders 
WHERE order_id IN (
    SELECT order_id 
    FROM order_items 
    WHERE category = 'Electronics'
);

-- Query 5: High earners exceeding their own department average
SELECT name, department_id, salary 
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees d
    WHERE d.department_id = e.department_id 
);
