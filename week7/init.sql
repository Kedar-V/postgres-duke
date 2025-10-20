DROP TABLE IF EXISTS order_items CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS payments CASCADE;

CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50),
    country VARCHAR(50),
    signup_date DATE
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id INT REFERENCES categories(category_id),
    price DECIMAL(10,2),
    stock_quantity INT
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE,
    status VARCHAR(20),
    total_amount DECIMAL(10,2)
);

CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT,
    unit_price DECIMAL(10,2)
);

CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    payment_date DATE,
    payment_method VARCHAR(30),
    amount DECIMAL(10,2)
);

INSERT INTO categories (category_name) VALUES
('Electronics'),
('Home & Kitchen'),
('Books'),
('Clothing'),
('Beauty');

INSERT INTO customers (first_name, last_name, email, city, country, signup_date) VALUES
('John', 'Doe', 'john@example.com', 'New York', 'USA', '2024-03-15'),
('Emma', 'Watson', 'emma@example.com', 'London', 'UK', '2023-12-10'),
('Raj', 'Sharma', 'raj@example.com', 'Mumbai', 'India', '2024-06-21'),
('Li', 'Wei', 'li@example.com', 'Beijing', 'China', '2024-02-18'),
('Sophia', 'Lopez', 'sophia@example.com', 'Madrid', 'Spain', '2024-05-03'),
('Carlos', 'Mendez', 'carlos@example.com', 'Mexico City', 'Mexico', '2024-01-25'),
('Ava', 'Patel', 'ava@example.com', 'Toronto', 'Canada', '2024-03-10');

INSERT INTO products (product_name, category_id, price, stock_quantity) VALUES
('iPhone 15', 1, 999.99, 50),
('Samsung Galaxy S24', 1, 899.99, 60),
('Blender', 2, 149.99, 40),
('Air Fryer', 2, 179.99, 35),
('Data Science Handbook', 3, 49.99, 100),
('Python Crash Course', 3, 39.99, 80),
('T-Shirt', 4, 19.99, 200),
('Jeans', 4, 49.99, 150),
('Face Cream', 5, 24.99, 120),
('Shampoo', 5, 14.99, 130);

INSERT INTO orders (customer_id, order_date, status, total_amount) VALUES
(1, '2024-07-10', 'Completed', 1049.98),
(1, '2024-07-20', 'Completed', 124.98),
(1, '2024-08-05', 'Pending', 49.99),
(2, '2024-07-12', 'Completed', 229.98),
(2, '2024-08-01', 'Completed', 49.99),
(3, '2024-07-15', 'Cancelled', 49.99),
(4, '2024-07-16', 'Completed', 69.98),
(4, '2024-07-30', 'Completed', 279.98),
(5, '2024-07-18', 'Pending', 999.99),
(6, '2024-07-19', 'Completed', 499.99),
(6, '2024-08-02', 'Completed', 149.99),
(7, '2024-07-22', 'Completed', 79.98);

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 999.99),
(1, 5, 1, 49.99),
(2, 7, 2, 19.99),
(3, 5, 1, 49.99),
(4, 3, 1, 149.99),
(4, 4, 1, 79.99),
(5, 5, 1, 49.99),
(6, 10, 2, 14.99),
(7, 2, 1, 899.99),
(7, 9, 4, 24.99),
(8, 6, 1, 39.99),
(9, 5, 2, 49.99),
(10, 9, 1, 24.99),
(11, 3, 1, 149.99),
(12, 7, 4, 19.99);

INSERT INTO payments (order_id, payment_date, payment_method, amount) VALUES
(1, '2024-07-10', 'Credit Card', 1049.98),
(2, '2024-07-20', 'PayPal', 124.98),
(4, '2024-07-12', 'Credit Card', 229.98),
(5, '2024-08-01', 'PayPal', 49.99),
(7, '2024-07-16', 'Debit Card', 69.98),
(8, '2024-07-30', 'Credit Card', 279.98),
(10, '2024-07-19', 'Credit Card', 499.99),
(11, '2024-08-02', 'PayPal', 149.99),
(12, '2024-07-22', 'Credit Card', 79.98);
