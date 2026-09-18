# Business Insights

Detailed findings from the E-Commerce Sales Analysis project.

---

## 1. Total Revenue

**Total revenue across all payments: ₹17,238**

This includes only orders that have a payment recorded. Cancelled orders (order_id 4, 10, 17) have no payment entries — so the actual revenue is from the 15 completed orders.

---

## 2. Top Revenue-Generating Product

**Python Hoodie** generated the highest revenue among delivered orders.

**Insight:** Hoodies (especially developer-themed ones) are the top sellers. Consider expanding the hoodie line.

---

## 3. Highest-Spending Customer

**Amit Sharma** spent the most — ₹2,497 across his orders.

**Insight:** Repeat customers like Amit are valuable. Consider a loyalty program to retain them.

---

## 4. Cancellation Rate

**3 out of 20 orders were cancelled — a 15% cancellation rate.**

Cancelled orders:
- Order 4 (Customer: Pooja Nair)
- Order 10 (Customer: Sneha Patel)
- Order 17 (Customer: Kritika Shah)

**Insight:** 15% is higher than the industry average (~10%). Investigate why — possible reasons could be payment issues, delivery delays, or stock problems.

---

## 5. Top City by Revenue

**Delhi** generated the highest revenue.

**Insight:** Delhi is the strongest market. Consider targeted marketing campaigns there.

---

## 6. Payment Mode Preferences

**UPI is the most used payment mode**, followed by Credit Card and Debit Card.

**Insight:** UPI dominance suggests customers prefer fast, digital payments. Ensure UPI checkout is smooth.

---

## 7. Best-Selling Products (by Quantity)

**Sticker Pack** and **SQL Cheat Sheet** sold in the highest quantities.

**Insight:** Low-cost items drive volume. Consider bundling them with higher-priced products.

---

## Recommendations

Based on the analysis:

1. **Focus marketing on Delhi** — highest revenue city
2. **Investigate cancellations** — 15% is above industry average
3. **Expand hoodie line** — top-performing category
4. **Launch loyalty program** — retain high-value customers
5. **Bundle low-cost items** with premium products to increase average order value
6. **Promote UPI checkout** — it's the preferred payment mode

---

## Limitations

- Small dataset (20 orders) — insights are directional, not definitive
- No customer demographics beyond city
- No time-series analysis (orders span only one month)

---

## Next Steps

- Build a Power BI dashboard to visualize these insights
- Expand dataset to 1,000+ orders for more reliable analysis
- Add customer segmentation (new vs returning)
- Track monthly revenue trends








