# Zomato-SQL-Project

# 🍽️ Zomato Sales & Customer Insights - SQL Project

This project provides insights into a fictional Zomato-style food delivery dataset using **advanced SQL queries**. It covers revenue analysis, customer behavior, delivery efficiency, and discount impact. Perfect for showcasing skills in **SQL analytics**, **window functions**, and **data-driven business decision-making**.

## 📊 Dataset Overview

The dataset simulates Zomato orders and contains the following columns:

| Column Name        | Data Type     | Description                                      |
|--------------------|---------------|--------------------------------------------------|
| `OrderID`          | INT           | Unique identifier for each order                |
| `OrderDate`        | DATE          | Date of the order                               |
| `Restaurant`       | VARCHAR(50)   | Name of the restaurant                          |
| `City`             | VARCHAR(50)   | City where the order was placed                 |
| `Cuisine`          | VARCHAR(50)   | Cuisine type (e.g., Chinese, Indian)            |
| `Item`             | VARCHAR(50)   | Food item ordered                               |
| `Quantity`         | INT           | Quantity of the item ordered                    |
| `UnitPrice`        | FLOAT         | Price per item                                  |
| `Discount`         | FLOAT         | Discount applied on the order                   |
| `DeliveryTimeMins` | FLOAT         | Delivery time in minutes                        |
| `CustomerRating`   | FLOAT         | Rating given by customer (1–5 scale)            |
| `TotalAmount`      | FLOAT         | Final amount paid after discount                |

---

## 🔍 Business Questions Answered

1. **Top 3 Restaurants per City (by Revenue)**  
   Identify the highest revenue-generating restaurants in each city.

2. **Most Ordered Item for Each Cuisine**  
   Pinpoint the top-selling item in every cuisine category.

3. **Underperforming Restaurants (Customer Rating)**  
   Find restaurants whose average rating is below the overall average.

4. **Revenue Contribution by City (%)**  
   Calculate each city’s percentage contribution to total revenue.

5. **High-Value Orders (₹1000+)**  
   Detect customers who placed multiple high-value orders.

6. **Average Delivery Time by Discount Level**  
   Analyze delivery time efficiency based on discount percentages.

7. **Most Profitable Cuisine in Each City**  
   Determine cuisines bringing in the highest net profit per city.

8. **Average Rating by Price Range**  
   Classify menu items into price ranges and evaluate their ratings.

9. **Items with High Discounts & High Demand**  
   Identify items with the highest average discount and over 100 units sold.

---

## 🛠️ Tools Used

- **PostgreSQL**
- SQL Window Functions (`RANK()`)
- Aggregations (`SUM`, `AVG`)
- Conditional Logic (`CASE WHEN`)
- Subqueries and HAVING clauses

---

## 🚀 How to Use

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/zomato-sql-analytics.git
