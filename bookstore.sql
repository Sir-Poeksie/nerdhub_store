
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



CREATE TABLE shipping_method (
    method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(100)
);


CREATE TABLE order_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) -- e.g., pending, shipped, delivered
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
    ('United States'),
    ('Canada'),
    ('United Kingdom'),
    ('Australia'),
    ('Germany'),
    ('South Africa');

INSERT INTO address (street, city, postal_code, country_id) 
VALUES 
('1325 Motintinyane', 'Pretoria', '0122', 6),
('153 3rd Avenue', 'Johannesburg', '2014', 6),
('789 High St', 'London', 'SW1A 1AA', 3),
('101 Elm St', 'Sydney', '2000', 4),
('202 Oak St', 'Berlin', '10115', 5),
('15 Nelson Mandela Ave', 'Cape Town', '8001', 6),
('22 Long Street', 'Johannesburg', '2000', 6),
('45 Table Mountain Rd', 'Cape Town', '8002', 6),
('78 Freedom Way', 'Durban', '4001', 6),
('90 Safari Lane', 'Pretoria', '0002', 6),
('12 Gold Reef Rd', 'Johannesburg', '2001', 6),
('34 Green Point St', 'Cape Town', '8003', 6),
('56 Zulu St', 'Durban', '4002', 6),
('67 Kruger Rd', 'Pretoria', '0003', 6),
('89 Soweto St', 'Johannesburg', '2002', 6);

INSERT INTO address_status (status_name)
    VALUES
    ('current'),
    ('old'),
    ('temporary'),
    ('permanent');

INSERT INTO customer (first_name, last_name, email) 
VALUES 
('Matthew', 'Mahlangu', 'matthewsiyabonga@gmail.com'),
('Somakhawula', 'Mrube', 'sohawulamrube@gmail.com'),
('Alice', 'Johnson', 'alicejohnson@gmail.com'),
('Bob', 'Brown', 'bobbrown@gmail.com'),
('Charlie', 'Davis', 'charliedavis@gmail.com'),
('Sipho', 'Nkosi', 'sipho.nkosi@example.com'),
('Thandi', 'Moyo', 'thandi.moyo@example.com'),
('Lerato', 'Dlamini', 'lerato.dlamini@example.com'),
('Kabelo', 'Mabena', 'kabelo.mabena@example.com'),
('Zanele', 'Khumalo', 'zanele.khumalo@example.com'),
('Sibusiso', 'Zulu', 'sibusiso.zulu@example.com'),
('Nomsa', 'Ngcobo', 'nomsa.ngcobo@example.com'),
('Andile', 'Mthembu', 'andile.mthembu@example.com'),
('Bongani', 'Mkhize', 'bongani.mkhize@example.com'),
('Nokuthula', 'Mbatha', 'nokuthula.mbatha@example.com');

INSERT INTO customer_address (customer_id, address_id, status_id) 
    VALUES 
    (1, 1, 1),
    (2, 2, 1),
    (3, 3, 1),
    (4, 4, 1),
    (5, 5, 1),
    (6, 6, 2),
    (7, 7, 2),
    (8, 8, 2),
    (9, 9, 2),
    (10, 10, 2),
    (11, 11, 2),
    (12, 12, 2),
    (13, 13, 2),
    (14, 14, 2),
    (15, 15, 2);

INSERT INTO author (name) 
    VALUES 
    ('J.K. Rowling'),
    ('George R.R. Martin'),
    ('J.R.R. Tolkien'),
    ('Agatha Christie'),
    ('Stephen King'),
    ('Nelson Mandela'), 
    ('Desmond Tutu'), 
    ('Chimamanda Ngozi Adichie'), 
    ('Wole Soyinka'), 
    ('Nadine Gordimer'), 
    ('Alan Paton'), 
    ('Athol Fugard'), 
    ('John Maxwell Coetzee'), 
    ('Zakes Mda'), 
    ('Miriam Tlali');

INSERT INTO book_language (language_name)
    VALUES 
    ('English'),
    ('Ndebele'), 
    ('German'), 
    ('Zulu'), 
    ('Pedi'),
    ('Xhosa'),
    ('Afrikaans');

INSERT INTO publisher (name)
    VALUES 
    ('Penguin Random House'), 
    ('HarperCollins'), 
    ('Macmillan'), 
    ('Simon & Schuster'),
    ('Hachette'),
    ('South African Books'), 
    ('Cape Town Publishing'), 
    ('Johannesburg Press'), 
    ('Durban Writers'), 
    ('Pretoria Publishers');

INSERT INTO book (title, isbn, language_id, publisher_id, price) 
VALUES 
('Harry Potter', '9780439139601', 1, 1, 19.99),
('Game of Thrones', '9780553103540', 1, 2, 29.99),
('The Hobbit', '9780547928227', 1, 3, 14.99),
('Murder on the Orient Express', '9780062073501', 1, 4, 9.99),
('The Shining', '9780307743657', 1, 5, 15.99),
('Long Walk to Freedom', '9780316548182', 1, 6, 25.99),
('No Future Without Forgiveness', '9780385496902', 1, 7, 19.99),
('Half of a Yellow Sun', '9781400095209', 1, 8, 18.99),
('The Interpreters', '9780435905569', 1, 9, 15.99),
('July\'s People', '9780140061406', 1, 10, 12.99),
('Cry, the Beloved Country', '9780743262170', 1, 6, 14.99),
('Tsotsi', '9781415202005', 1, 7, 16.99),
('Disgrace', '9780143115281', 1, 8, 13.99),
('Ways of Dying', '9780195716817', 1, 9, 11.99),
('Between Two Worlds', '9780869752146', 1, 10, 10.99);

INSERT INTO shipping_method (method_name)
VALUES 
('Standard'), ('Express'), ('Overnight'),('Pickup');

INSERT INTO order_status (status_name)
VALUES 
('Pending'), ('Shipped'), ('Delivered'),('Cancelled');

INSERT INTO cust_order (customer_id, order_date, status_id, shipping_method_id) 
VALUES 
(1, '2025-04-01', 1, 1),
(2, '2025-04-02', 2, 2),
(3, '2025-04-03', 3, 3),
(4, '2025-04-04', 1, 1),
(5, '2025-04-05', 2, 2),
(6, '2025-04-06', 1, 1),
(7, '2025-04-07', 2, 2),
(8, '2025-04-08', 3, 1),
(9, '2025-04-09', 1, 2),
(10, '2025-04-10', 2, 1),
(11, '2025-04-11', 3, 2),
(12, '2025-04-12', 1, 1),
(13, '2025-04-13', 2, 2),
(14, '2025-04-14', 3, 1),
(15, '2025-04-15', 1, 2);

INSERT INTO order_line (order_id, book_id, quantity) 
VALUES 
(1, 1, 2),
(2, 2, 1),
(3, 3, 3),
(4, 4, 1),
(5, 5, 2),
(6, 6, 1),
(7, 7, 2),
(8, 8, 1),
(9, 9, 3),
(10, 10, 1),
(11, 11, 2),
(12, 12, 1),
(13, 13, 3),
(14, 14, 1),
(15, 15, 2);

INSERT INTO order_history (order_id, status_id) 
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(5, 2),
(6, 1),
(7, 2),
(8, 3),
(9, 1),
(10, 2),
(11, 3),
(12, 1),
(13, 2),
(14, 3),
(15, 1);

CREATE TABLE order_line (
    order_id INT,
    book_id INT,
    quantity INT,
    PRIMARY KEY (order_id, book_id),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);
    
-- QUERIES & VIEWS

SELECT c.first_name, c.last_name, b.title, ol.quantity, co.order_date
FROM customer c
JOIN cust_order co ON c.customer_id = co.customer_id
JOIN order_line ol ON co.order_id = ol.order_id
JOIN book b ON ol.book_id = b.book_id;

    -- Book Order
CREATE VIEW vw_book_order_summary AS
SELECT 
    b.title,
    SUM(ol.quantity) AS total_sold,
    COUNT(DISTINCT ol.order_id) AS total_orders
FROM order_line ol
JOIN book b ON ol.book_id = b.book_id
GROUP BY b.title;

-- Order perShipping meth
SELECT sm.method_name, COUNT(*) AS total_orders
FROM cust_order co
JOIN shipping_method sm ON co.shipping_method_id = sm.method_id
GROUP BY sm.method_name;


-- Add new Customer

DELIMITER //
CREATE PROCEDURE AddCustomerWithAddress(
    IN fname VARCHAR(100),
    IN lname VARCHAR(100),
    IN email VARCHAR(255),
    IN street VARCHAR(255),
    IN city VARCHAR(100),
    IN postal VARCHAR(20),
    IN countryName VARCHAR(100),
    IN statusName VARCHAR(50)
)
BEGIN
    DECLARE cid INT;
    DECLARE addr_id INT;
    DECLARE country_id INT;
    DECLARE status_id INT;

    SELECT country_id INTO country_id FROM country WHERE name = countryName;
    SELECT status_id INTO status_id FROM address_status WHERE status_name = statusName;

    INSERT INTO customer(first_name, last_name, email) VALUES(fname, lname, email);
    SET cid = LAST_INSERT_ID();

    INSERT INTO address(street, city, postal_code, country_id) 
    VALUES(street, city, postal, country_id);
    SET addr_id = LAST_INSERT_ID();

    INSERT INTO customer_address(customer_id, address_id, status_id) 
    VALUES(cid, addr_id, status_id);
END //
DELIMITER ;

-- Client Order History

DELIMITER //
CREATE PROCEDURE GetCustomerOrderHistory(IN cust_id INT)
BEGIN
    SELECT co.order_id, b.title, ol.quantity, os.status_name, oh.updated_at
    FROM cust_order co
    JOIN order_line ol ON co.order_id = ol.order_id
    JOIN book b ON ol.book_id = b.book_id
    JOIN order_status os ON co.status_id = os.status_id
    LEFT JOIN order_history oh ON co.order_id = oh.order_id
    WHERE co.customer_id = cust_id;
END //
DELIMITER ;

-- TODO: Trigger log Order_Status
DELIMITER //
CREATE TRIGGER trg_log_order_status
AFTER UPDATE ON cust_order
FOR EACH ROW
BEGIN
    IF OLD.status_id != NEW.status_id THEN
        INSERT INTO order_history(order_id, status_id)
        VALUES(NEW.order_id, NEW.status_id);
    END IF;
END //
DELIMITER ;

-- Customer w Order deleted Prevention

DELIMITER //
CREATE TRIGGER trg_prevent_customer_delete
BEFORE DELETE ON customer
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM cust_order WHERE customer_id = OLD.customer_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete customer with existing orders.';
    END IF;
END //
DELIMITER ;


