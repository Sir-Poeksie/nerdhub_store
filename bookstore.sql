CREATE DATABASE BookStoreDB;
USE BookStoreDB;

CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(255),
    city VARCHAR(100),
    postal_code VARCHAR(20),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

CREATE TABLE address_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) -- e.g., 'current', 'old'
);

CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255) UNIQUE
);

CREATE TABLE customer_address (
    customer_id INT,
    address_id INT,
    status_id INT,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (status_id) REFERENCES address_status(status_id)
);

CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE book_language (
    language_id INT AUTO_INCREMENT PRIMARY KEY,
    language_name VARCHAR(50)
);

CREATE TABLE publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    isbn VARCHAR(13),
    language_id INT,
    publisher_id INT,
    price DECIMAL(10,2),
    FOREIGN KEY (language_id) REFERENCES book_language(language_id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
);

CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

CREATE TABLE cust_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status_id INT,
    shipping_method_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(method_id)
);

CREATE TABLE order_line (
    order_id INT,
    book_id INT,
    quantity INT,
    PRIMARY KEY (order_id, book_id),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

CREATE TABLE shipping_method (
    method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(100)
);

CREATE TABLE order_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) -- e.g., pending, shipped, delivered
);

CREATE TABLE order_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    status_id INT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);

-- INSERTING DATA INTO THE TABLES

INSERT INTO country (name)
    VALUES
    ('United States'), ('Canada'), ('United Kingdom'), ('Australia'), ('Germany');

INSERT INTO address (street, city, postal_code, country_id) 
VALUES 
('123 Main St', 'New York', '10001', 1),
('456 Maple Ave', 'Toronto', 'M4B 1B4', 2),
('789 High St', 'London', 'SW1A 1AA', 3),
('101 Elm St', 'Sydney', '2000', 4),
('202 Oak St', 'Berlin', '10115', 5);

INSERT INTO address_status (status_name) VALUES ('current'), ('old');

INSERT INTO customer (first_name, last_name, email) 
VALUES 
('Matthew', 'Mahlangu', 'matthewsiyabonga@gmail.com'),
('Somakhawula', 'Mrube', 'sohawulamrube@gmail.com'),
('Alice', 'Johnson', 'alice.johnson@gmail.com'),
('Bob', 'Brown', 'bob.brown@gmail.com'),
('Charlie', 'Davis', 'charlie.davis@gmail.com');

INSERT INTO customer_address (customer_id, address_id, status_id) 
    VALUES 
    (1, 1, 1),
    (2, 2, 1),
    (3, 3, 1),
    (4, 4, 1),
    (5, 5, 1);

INSERT INTO author (name) 
    VALUES 
    ('J.K. Rowling'), ('George R.R. Martin'), ('J.R.R. Tolkien'), ('Agatha Christie'), ('Stephen King');

INSERT INTO book_language (language_name)
    VALUES 
    ('English'), ('Ndebele'), ('German'), ('Zulu'), ('Pedi');

INSERT INTO publisher (name) VALUES ('Penguin Random House'), ('HarperCollins'), ('Macmillan'), ('Simon & Schuster'), ('Hachette');

INSERT INTO book (title, isbn, language_id, publisher_id, price) 
VALUES 
('Harry Potter', '9780439139601', 1, 1, 19.99),
('Game of Thrones', '9780553103540', 1, 2, 29.99),
('The Hobbit', '9780547928227', 1, 3, 14.99),
('Murder on the Orient Express', '9780062073501', 1, 4, 9.99),
('The Shining', '9780307743657', 1, 5, 15.99);

INSERT INTO shipping_method (method_name)
VALUES 
('Standard'), ('Express'), ('Overnight');

INSERT INTO order_status (status_name)
VALUES 
('Pending'), ('Shipped'), ('Delivered');

INSERT INTO cust_order (customer_id, order_date, status_id, shipping_method_id) 
VALUES 
(1, '2025-04-01', 1, 1),
(2, '2025-04-02', 2, 2),
(3, '2025-04-03', 3, 3),
(4, '2025-04-04', 1, 1),
(5, '2025-04-05', 2, 2);

INSERT INTO order_line (order_id, book_id, quantity) 
VALUES 
(1, 1, 2),
(2, 2, 1),
(3, 3, 3),
(4, 4, 1),
(5, 5, 2);

INSERT INTO order_history (order_id, status_id) 
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(5, 2);


