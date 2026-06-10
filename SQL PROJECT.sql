CREATE TABLE Books (
   Book_ID SERIAL PRIMARY KEY,
   Title VARCHAR(100),
   Author VARCHAR(100),
   Genre VARCHAR(50),
   Published_Year INT,
   Price NUMERIC(10, 2),
   Stock INT 
);

CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
	Name VARCHAR(100),
	Email VARCHAR(100),
	Phone VARCHAR(15),
	City VARCHAR(50),
	Country VARCHAR(150)
);

CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
	Customer_ID INT REFERENCES Customers(Customer_ID),
	Book_ID INT REFERENCES Books(Book_ID),
	Order_Date DATE,
	Quantity INT,
	Total_Amount NUMERIC(10, 2)
);

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

-- Retrieve all books in the 'fiction' genre

SELECT * FROM Books
WHERE genre='Fiction';

-- Find books which are published in 1950

SELECT * FROM Books
WHERE published_year>1950;

-- List all the customers from Canada

SELECT * FROM Customers
WHERE country='Canada'

-- Show orders placed in november 2023

SELECT * FROM Orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30'

-- Retrieve the total stock of books available

SELECT SUM(stock) AS total_stock
FROM Books;

-- Find the details of the most expensive books

SELECT * FROM Books ORDER BY price DESC LIMIT 1;

-- Show all customers who order more than 1 quantity of a book

SELECT * FROM Orders
WHERE quantity>1;

-- Retrieve all the orders where total amount exceeds 20$

SELECT * FROM Orders
WHERE total_amount>20;

-- List all the genres in the books table

SELECT DISTINCT genre FROM Books;

-- Find the book with the lowest stock;

SELECT * FROM Books 
ORDER BY stock LIMIT 1 

-- calculate the revenue generated from all orders

SELECT SUM(total_amount) AS total_revenue 
FROM Orders;

-- retrieve the total number of books sold for each genre

SELECT b.genre, SUM(o.quantity) AS total_books_sold
FROM orders o
JOIN Books b ON b.book_id = o.book_id
GROUP BY b.genre;

-- find average price of books in fantasy genre

SELECT AVG(price) AS avg_price
FROM Books
WHERE Genre='Fantasy';

-- List customers who have places at least 2 orders

SELECT o.customer_id, c.name,  COUNT(o.order_id) AS order_count
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY o.customer_id, c.name
HAVING COUNT(order_id)>=2;

-- find the most frequently ordered book;

SELECT o.book_id, b.title, COUNT(o.order_id) AS order_count
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY o.book_id, b.title
ORDER BY order_count DESC LIMIT 1;

-- SHOW THE top 3 most ecpensive books of fantasy genre

SELECT * FROM books
WHERE genre='Fantasy'
ORDER BY price DESC LIMIT 3;

-- Retrieve the total quantity of books sold by each author;

SELECT b.author, SUM(o.quantity) AS total_books_sol
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY b.author;

-- list the cities where customers who spent over $30 are located

SELECT DISTINCT c.city, o.total_amount
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
WHERE o.total_amount>30;

-- find the customer who spent the most on orders

SELECT c.name, SUM(o.total_amount) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY c.name 
ORDER BY total_spent DESC LIMIT 1;

-- CALculate the stock  remaining after fulfiling all orders

SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS order_quantity, 
b.stock- COALESCE(SUM(o.quantity),0) AS remainin_quantity
FROM books b
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id;
