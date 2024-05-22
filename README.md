# SQL Queries and Solutions - README

This README.md file provides detailed explanations and documentation for a set of SQL queries. Each query addresses a specific question or scenario, and this document includes information on how each question was approached, the SQL query used to solve it, any challenges faced during implementation, and the solutions applied to resolve those challenges.

# E-Commerce Database System

## Introduction
This repository contains the implementation of an e-commerce platform's database system, designed to facilitate interactions between sellers, customers, products, and orders. The system efficiently manages these entities and their relationships, ensuring smooth e-commerce operations. This document provides insights into the database schema, the purpose of each table, their relationships, and a comprehensive report on specific SQL queries, challenges encountered, and solutions employed.

## Database Schema
The database consists of several tables, each representing different entities in the e-commerce system:


### Sellers
This table contains information about the sellers. Each seller is uniquely identified by a SellerID. Other details such as the seller's name, email, and phone number are also stored.
- **Sellers**: Information about the sellers.

### Customers
The Customers table holds information about customers, each having a unique CustomerID. It stores the customer's name, email, and phone number.
- **Customers**: Details of customers.

### Products
Products available in the e-commerce platform are stored in the Products table. Each product has a unique ProductID, and the table also includes details about the product name, description, price, and the ID of the seller (SellerID) offering the product.
- **Products**: Products available on the platform.

### Orders
The Orders table logs the orders placed by customers. Each order is uniquely identified by an OrderID and also includes details like the order number, the timestamp when the order was created, the total amount of the order, and the ID of the customer who placed the order.
- **Orders**: Logs of orders placed.

### OrderItems
This table keeps track of the individual items within each order. Each record has a unique OrderItemID and references the order (OrderID) and the product (ProductID). It also stores the quantity of the product ordered and the price of the product at the time the order was placed.
- **OrderItems**: Details of individual items within each order.

### ShoppingCarts
The ShoppingCarts table represents the shopping cart for each customer, with a unique CartID and a reference to the customer (CustomerID).
- **ShoppingCarts**: Shopping cart for each customer.

### CartItems
Items in a shopping cart are represented in the CartItems table. Each item is identified by a unique CartItemID and references the shopping cart (CartID) and the product (ProductID). The quantity of the product in the cart is also stored.
- **CartItems**: Items in a shopping cart.

### Payments
The Payments table records the payment details for orders. Each record is uniquely identified by a PaymentID and contains information on the order (OrderID), the payment method, the amount paid, and the timestamp when the payment was made.
- **Payments**: Payment details for orders.

### Reviews
The Reviews table holds the reviews submitted by customers for products. Each review has a unique ReviewID and references the product (ProductID) and the customer (CustomerID). The review rating and comments are also stored.
- **Reviews**: Reviews submitted by customers.

### Addresses
Customer addresses are stored in the Addresses table. Each address has a unique AddressID and is linked to a customer (CustomerID). The table includes details like the address line, city, state, zip code, country, and whether the address is used for billing and/or shipping.
- **Addresses**: Customer address details.

### Inventory
The Inventory table manages the inventory records for products. Each inventory entry has a unique InventoryID and is linked to a product (ProductID). It tracks the quantity of the product in stock, the last time the stock was updated, the threshold for reordering, and the cost per unit for the seller.
- **Inventory**: Inventory records for products.


### Entity Relationships
- Sellers to Products: One-to-many
- Customers to Orders: One-to-many
- Orders to OrderItems: One-to-many
- Customers to ShoppingCarts: One-to-one
- ShoppingCarts to CartItems: One-to-many
- Orders to Payments: One-to-one
- Customers to Reviews: One-to-many
- Products to Reviews: One-to-many
- Customers to Addresses: One-to-many
- Products to Inventory: One-to-one

## ERD Explanation
The Entity-Relationship Diagram (ERD) visually represents the database schema, highlighting entities, their attributes, and the relationships between them. It's crucial for understanding the data's interconnectedness and guides the creation of efficient SQL queries.

## Query Explanations and Challenges
### 1. Retrieve Total Sales by Seller
- **Explanation**: Calculates total sales for each seller by aggregating order amounts.
- **Challenges**: Involves complex joins and assumes consistent data.
- **Solutions**: Use of indexing on foreign keys and regular data updates.

### 2. Check Inventory Below Reorder Threshold
- **Explanation**: Identifies products needing restocking.
- **Challenges**: Requires real-time data and accounts for threshold variability.
- **Solutions**: Implementation of database triggers and dynamic reorder thresholds.

### 3. Retrieve Orders by Customer with Address
- **Explanation**: Retrieves order details with shipping address for a specific customer.
- **Challenges**: Handles multiple addresses and ensures data privacy.
- **Solutions**: Logic for address selection and robust security measures.

## Example Queries
```sql
-- Retrieve Total Sales by Seller
SELECT Sellers.SellerID, Sellers.Name, SUM(Orders.TotalAmount) AS TotalSales
FROM Sellers
JOIN Products ON Sellers.SellerID = Products.SellerID
JOIN OrderItems ON Products.ProductID = OrderItems.ProductID
JOIN Orders ON OrderItems.OrderID = Orders.OrderID
GROUP BY Sellers.SellerID, Sellers.Name;

-- Check Inventory Below Reorder Threshold
SELECT I.ProductID, P.Name, I.QuantityInStock
FROM Inventory I
JOIN Products P ON I.ProductID = P.ProductID
WHERE I.QuantityInStock < I.ReorderThreshold;

-- Retrieve Orders by Customer with Address
SELECT O.OrderID, O.OrderNumber, O.TotalAmount, A.AddressLine1, A.City, A.State, A.ZipCode
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
JOIN Addresses A ON C.CustomerID = A.CustomerID
WHERE A.IsShipping = 1 AND C.CustomerID = ?; -- Replace ? with the customer's ID


