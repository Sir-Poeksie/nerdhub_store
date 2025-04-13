# NerdHub Store Order System

This is a basic relational database schema designed to manage books, customers, orders, and the items within those orders. It's ideal for a small to medium-sized bookstore to track inventory and customer purchases.

## 📚 Entities

### 1. `book`
Stores information about books.

| Column     | Type    | Description            |
|------------|---------|------------------------|
| book_id    | INTEGER | Primary key            |
| title      | TEXT    | Book title             |
| author     | TEXT    | Book author            |
| price      | DECIMAL | Price per book         |

### 2. `customer`
Stores customer details.

| Column      | Type    | Description        |
|-------------|---------|--------------------|
| customer_id | INTEGER | Primary key        |
| name        | TEXT    | Customer full name |
| email       | TEXT    | Unique email       |

### 3. `orders`
Represents customer orders.

| Column      | Type    | Description                    |
|-------------|---------|--------------------------------|
| order_id    | INTEGER | Primary key                    |
| customer_id | INTEGER | Foreign key → customer         |
| order_date  | DATE    | Date when order was placed     |

### 4. `order_line`
Line items in an order — each book and quantity.

| Column    | Type    | Description                      |
|-----------|---------|----------------------------------|
| order_id  | INTEGER | Foreign key → orders             |
| book_id   | INTEGER | Foreign key → book               |
| quantity  | INTEGER | Number of copies ordered         |
| **PK**    |         | Composite: (order_id, book_id)   |

## 🔗 Relationships

- A **customer** can place multiple **orders**.
- An **order** contains one or more **order_line** items.
- Each **order_line** links a **book** to an **order**.

## 💡 Example Use Cases

- Insert and update orders and their line items.
- Generate reports by joining orders, customers, and books.
- Ensure data integrity through foreign and composite primary keys.

## 🛠️ Technologies

- SQL (PostgreSQL / MySQL)
- ERD Tool: [Draw.io](https://app.diagrams.net)
