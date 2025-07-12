# Inventory-Intelligence-Optimization-Dashboard
This project optimizes retail inventory by analyzing stock, pricing, and discount data. Using Python, MySQL, and Power BI, it identifies stockouts, dead stock, and ABC classes to improve planning, reduce loss, and boost margins.

# 📦 Inventory Intelligence & Optimization Dashboard

This project is a full-cycle data analysis case study based on a real-world retail inventory dataset. The goal is to extract actionable insights from raw data to help businesses optimize inventory planning, identify dead stock, monitor discounts, and maximize margins. The study was executed using:

- 🐍 **Python (Pandas)** for data cleaning and preprocessing  
- 🛢 **MySQL** for deep-dive analytical queries  
- 📊 **Power BI** for KPI visualization and interactive reporting  

---

## 🐍 Python – Data Preparation (Highlights)

- Cleaned column names and removed special characters  
- Converted `MRP` and `DiscountedSellingPrice` from paise to rupees  
- Created a new calculated field: `Inventory_Value = AvailableQuantity * DiscountedSellingPrice`  
- Exported cleaned DataFrame directly to MySQL for further analysis  

---

## 🛢 MySQL – Analytical Questions Performed

### 📊 Basic Inventory Metrics

1. Total number of products per category  
2. Total available quantity per category  
3. Average discount percentage per category  
4. Total inventory value per category  
5. Sum of MRP and Selling Price by category  

### 🚨 Dead Stock & Stockout Detection

6. Products that are out of stock  
7. Count of out-of-stock products per category  
8. Products in stock with 0% discount (potential dead stock)  
9. High-discount (>30%) & low-stock products (fast-moving items)  

### 🔠 ABC Classification

10. Classified SKUs into A/B/C categories based on inventory value using `NTILE()` window function  

### 🧠 Category-Level Insights

11. Products in the top 20% by inventory value within their category (`PERCENT_RANK()`)  
12. Products with discount % higher than the category average (using CTE + JOIN)  
13. Categories with highest % of out-of-stock products (`CASE` + aggregate logic)  

---

## 📊 Power BI – Dashboard Summary

The cleaned MySQL data was imported into Power BI to build a 2-page interactive dashboard:

### 📄 Page 1 – KPI Snapshot



### 📈 Page 2 – Visual Analysis



## 📌 Insights & Conclusions

- ✅ A small number of products (Class A) contribute the majority of the total inventory value.
- ❌ Several categories have a high percentage of out-of-stock items, affecting availability.
- 📉 Multiple products with zero discount and high stock indicate potential dead stock.
- ⚠️ Discounting is inconsistent across categories — some receive excessive or no offers.
- 📦 Fast-moving items were identified by high discounts and low available quantity.
- 🏷️ Margins vary widely across products, helping prioritize high-profit SKUs.
- 🧮 ABC classification helped segment products by value for smarter replenishment strategies.
- 📊 Categories like *Munchies* and *Fruits* showed high stock turnover, indicating strong demand.
- 📈 Average discount % per category revealed over-discounting risks in certain segments.
- 🪙 Some products had selling prices very close to MRP, suggesting tight pricing control.
- 💡 These insights support better stock planning, reduce holding costs, and guide discount strategy.


---

> ✅ This project demonstrates hands-on skills in Python, SQL, and Power BI — tailored for data analyst, operations analyst, and BI roles.

