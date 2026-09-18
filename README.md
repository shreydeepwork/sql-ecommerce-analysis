# E-Commerce Sales Analysis (SQL)

A relational database project built with MySQL to analyze e-commerce sales, customer behavior, and payment patterns.

---

## What This Project Does

This project simulates a small e-commerce store's backend. It includes:
- 5 interconnected tables (customers, products, orders, order_items, payments)
- 20 customers, 20 products, and 20 orders with realistic data
- 6 analytical queries to answer real business questions

The goal was to practice relational database design and use SQL to extract insights.

---

## Database Structure

The database has 5 tables:

| Table | Purpose |
|-------|---------|
| `customers` | Customer info (name, email, city, signup date) |
| `products` | Product catalog (name, category, price, stock) |
| `orders` | Order records (customer, date, status) |
| `order_items` | Products in each order (quantity) |
| `payments` | Payment records (mode, amount, date) |

**Relationships:**
- One customer → many orders
- One order → many products (via `order_items`)
- One order → one payment

---

## Key Insights

- **Total Revenue:** ₹17,238
- **Top Product:** Python Hoodie (highest revenue)
- **Top Customer:** Amit Sharma (₹2,497 spent)
- **Cancellation Rate:** 15% (3 out of 20 orders)
- **Top City:** Delhi (highest revenue)
- **Most Used Payment:** UPI

---

## Files in This Repository

| File | What It Contains |
|------|------------------|
| `README.md` | Project overview (this file) |
| `01_create_database.sql` | Creates the database and tables |
| `02_insert_data.sql` | Inserts sample data |
| `03_analysis_queries.sql` | All 6 analytical queries |
| `04_insights.md` | Detailed business insights |

---

## How to Run

1. Open MySQL Workbench
2. Run `01_create_database.sql`
3. Run `02_insert_data.sql`
4. Run `03_analysis_queries.sql`
5. Read `04_insights.md` for interpreted results

---

## SQL Concepts Used

- Table creation with PRIMARY KEY, FOREIGN KEY, AUTO_INCREMENT
- Multi-row INSERT
- Multi-table JOINs
- GROUP BY with SUM, COUNT
- Subqueries
- UNION / UNION ALL
- ROLLUP
- Stored Procedures
- Triggers

---

## Tools Used

- MySQL 8.0
- MySQL Workbench

---

## What I Learned

- How to design a normalized relational database
- How foreign keys maintain data integrity
- How JOINs connect data across multiple tables
- Why mixing `payments` with `order_items` can inflate numbers
- How to use GROUP BY to answer business questions

---

## Next Steps

- Build a Power BI dashboard connected to this database
- Add window functions and CTEs
- Expand the dataset for performance testing
