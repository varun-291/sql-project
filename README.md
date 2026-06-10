# 📚 Bookstore Sales Analysis using PostgreSQL

## Project Overview

This project analyzes bookstore sales data using PostgreSQL. The analysis focuses on customer purchasing behavior, book sales performance, revenue generation, and inventory management. By working with customer, book, and order datasets, various business questions were answered using SQL queries and data analysis techniques.

## Dataset

The project uses three datasets:

### Customers
Contains customer information such as:
- Customer ID
- Name
- City
- Country

### Books
Contains book-related information such as:
- Book ID
- Title
- Author
- Genre
- Price
- Stock
- Published Year

### Orders
Contains order transaction details such as:
- Order ID
- Customer ID
- Book ID
- Quantity
- Order Date
- Total Amount

---

## Tools Used

- PostgreSQL
- SQL
- GitHub

---

## SQL Concepts Demonstrated

- Filtering (WHERE)
- Sorting (ORDER BY)
- Aggregate Functions (SUM, AVG, COUNT)
- GROUP BY
- HAVING
- INNER JOIN
- LEFT JOIN
- DISTINCT
- COALESCE
- Business-Oriented Data Analysis

---

## Business Questions Solved

### Sales Analysis
- Calculate total revenue generated from all orders.
- Identify the most frequently ordered book.
- Determine the total quantity of books sold by genre.
- Calculate the total quantity of books sold by each author.

### Customer Analysis
- Identify customers who placed multiple orders.
- Find the customer with the highest total spending.
- Analyze customer purchase activity.

### Inventory Analysis
- Calculate total available stock.
- Identify books with the lowest stock levels.
- Calculate remaining inventory after fulfilling customer orders.

### Product Analysis
- Find the most expensive books.
- Identify top-priced books within a genre.
- Analyze genre-wise sales performance.

---

## Key Insights

- Revenue was generated through multiple customer transactions across various book genres.
- Certain books received significantly more orders than others, indicating higher customer demand.
- A small group of customers contributed a large share of total spending.
- Genre-level analysis helped identify categories with the highest sales volume.
- Inventory tracking revealed remaining stock after order fulfillment, helping monitor stock availability.

---

## Sample SQL Analysis

### Total Revenue Generated

```sql
SELECT SUM(total_amount) AS total_revenue
FROM Orders;
```

### Most Frequently Ordered Book

```sql
SELECT o.book_id, b.title, COUNT(o.order_id) AS order_count
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY o.book_id, b.title
ORDER BY order_count DESC
LIMIT 1;
```

### Customer with Highest Spending

```sql
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 1;
```

---

## Project Structure

```text
Bookstore-Sales-Analysis-SQL/
│
├── Customers.xlsx
├── Books.xlsx
├── Orders.xlsx
├── Bookstore_SQL_Queries.sql
├── README.md
└── Screenshots/
```

---

## Skills Demonstrated

SQL • PostgreSQL • Data Analysis • Data Cleaning • Data Aggregation • Joins • Inventory Analysis • Sales Analytics • Business Insights

---

## Author

Varun Sharma

Aspiring Data Analyst skilled in SQL, Power BI, and Excel.
