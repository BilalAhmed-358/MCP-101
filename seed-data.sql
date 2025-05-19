-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS example_db;

-- Use the database
USE example_db;

-- Create the `products` table
CREATE TABLE IF NOT EXISTS products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);

-- Seed the `products` table with sample data
INSERT INTO products (name, description, price, stock) VALUES
('Laptop', 'A high-performance laptop', 999.99, 20),
('Smartphone', 'Latest model smartphone with a large screen', 699.99, 50),
('Headphones', 'Noise-cancelling over-ear headphones', 199.99, 100),
('Smartwatch', 'Wearable fitness tracker and smartwatch', 149.99, 30),
('Tablet', 'Lightweight tablet with a high-resolution display', 249.99, 40);

-- Create the `customers` table
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(20),
    address TEXT
);

-- Seed the `customers` table with sample data
INSERT INTO customers (first_name, last_name, email, phone, address) VALUES
('Alice', 'Johnson', 'alice.johnson@example.com', '555-1234', '123 Main St, Springfield'),
('Bob', 'Smith', 'bob.smith@example.com', '555-2345', '456 Oak St, Shelbyville'),
('Charlie', 'Brown', 'charlie.brown@example.com', '555-3456', '789 Pine St, Capital City'),
('Diana', 'Davis', 'diana.davis@example.com', '555-4567', '101 Maple St, Springfield'),
('Eve', 'Miller', 'eve.miller@example.com', '555-5678', '202 Birch St, Shelbyville');

-- create a simple relationship between customers and products (orders)
CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Seed the `orders` table with sample data
INSERT INTO orders (customer_id, product_id, quantity) VALUES
(1, 1, 1), 
(2, 2, 2),  
(3, 3, 1),  
(4, 4, 1),  
(5, 5, 2);  
