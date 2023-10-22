CREATE DATABASE DB12121

use DB12121

CREATE TABLE Sellers (
    SellerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100),
    Description TEXT,
    Price DECIMAL,
    SellerID INT,
    FOREIGN KEY (SellerID) REFERENCES Sellers(SellerID)
);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderNumber VARCHAR(50),
    CreationTimestamp datetime,
    TotalAmount DECIMAL,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);



CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    CurrentPrice DECIMAL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE ShoppingCarts (
    CartID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE CartItems (
    CartItemID INT PRIMARY KEY,
    CartID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (CartID) REFERENCES ShoppingCarts(CartID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentMethod VARCHAR(50),
    Amount DECIMAL,
    CreationTimestamp datetime,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);


CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    Rating INT,
    Comment TEXT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Addresses (
    AddressID INT PRIMARY KEY,
    CustomerID INT,
    AddressLine VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(20),
    Country VARCHAR(50),
    IsBillingAddress BIT,
    IsShippingAddress BIT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate datetime,
    ReorderThreshold INT,
    UnitCost DECIMAL,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);




-- Inserting data into the Sellers table
INSERT INTO Sellers (SellerID, Name, Email, PhoneNumber) VALUES
(1, 'Eco Modern Essentials', 'contact@ecomodern.com', '123-456-7890'),
(2, 'Fashion Fabrics', 'info@fashionfab.com', '234-567-8901'),
(3, 'Tech Universe', 'support@techuniverse.com', '345-678-9012'),
(4, 'Healthy Foods Inc', 'customer@healthyfoods.com', '456-789-0123'),
(5, 'Sports Gear Outlet', 'inquiry@sportsgear.com', '567-890-1234'),
(6, 'Pet Lovers Store', 'help@petlovers.com', '678-901-2345'),
(7, 'Gaming Central', 'games@gamingcentral.com', '789-012-3456'),
(8, 'Book Worm Haven', 'read@bookwormhaven.com', '890-123-4567'),
(9, 'Artistic Creations', 'art@artisticcreations.com', '901-234-5678'),
(10, 'Home Comforts', 'home@homecomforts.com', '012-345-6789');

-- Inserting data into the Customers table
INSERT INTO Customers (CustomerID, Name, Email, PhoneNumber) VALUES
(1, 'Alice Johnson', 'alice@email.com', '123-001-0001'),
(2, 'Bob Smith', 'bob@email.com', '123-001-0002'),
(3, 'Charlie Davis', 'charlie@email.com', '123-001-0003'),
(4, 'Diana White', 'diana@email.com', '123-001-0004'),
(5, 'Eric Watson', 'eric@email.com', '123-001-0005'),
(6, 'Fiona Brown', 'fiona@email.com', '123-001-0006'),
(7, 'George Wilson', 'george@email.com', '123-001-0007'),
(8, 'Hannah Miller', 'hannah@email.com', '123-001-0008'),
(9, 'Ivan Clark', 'ivan@email.com', '123-001-0009'),
(10, 'Julia Harris', 'julia@email.com', '123-001-0010');

INSERT INTO Products (ProductID, Name, Description, Price, SellerID) VALUES
(1, 'Organic Essential Oil', 'Lavender essential oil 30ml', 15.00, 1),
(2, 'Cotton Fabric', '100% pure cotton, 2 meters', 20.00, 2),
(3, 'Wireless Mouse', 'Bluetooth 5.0, ergonomic', 30.00, 3),
(4, 'Quinoa Pack', 'Organic white quinoa, 1kg', 10.00, 4),
(5, 'Yoga Mat', 'Eco-friendly, 6mm thickness', 25.00, 5),
(6, 'Cat Toy Set', 'Feather teasers, 5 toys', 18.00, 6),
(7, 'Action Video Game', 'PC, thrilling storyline', 50.00, 7),
(8, 'Classic Literature', 'Hardcover, collector’s edition', 12.00, 8),
(9, 'Acrylic Paint Set', '12 colors, non-toxic', 22.00, 9),
(10, 'Decorative Lamp', 'LED, touch control', 45.00, 10);

-- Inserting data into the Orders table
INSERT INTO Orders (OrderID, OrderNumber, CreationTimestamp, TotalAmount, CustomerID) VALUES
(1, 'ORD1001', '2023-01-01T10:00:00', 150.00, 1),
(2, 'ORD1002', '2023-01-02T11:30:00', 70.00, 2),
(3, 'ORD1003', '2023-01-03T14:00:00', 200.00, 3),
(4, 'ORD1004', '2023-01-04T09:30:00', 300.00, 4),
(5, 'ORD1005', '2023-01-05T12:45:00', 120.00, 5),
(6, 'ORD1006', '2023-01-06T15:00:00', 80.00, 6),
(7, 'ORD1007', '2023-01-07T17:30:00', 250.00, 7),
(8, 'ORD1008', '2023-01-08T13:00:00', 190.00, 8),
(9, 'ORD1009', '2023-01-09T16:15:00', 140.00, 9),
(10, 'ORD1010', '2023-01-10T11:00:00', 210.00, 10);

-- Inserting data into the OrderItems table
INSERT INTO OrderItems (OrderItemID, OrderID, ProductID, Quantity, CurrentPrice) VALUES
(1, 1, 1, 2, 15.00),
(2, 2, 2, 1, 20.00),
(3, 3, 3, 3, 30.00),
(4, 4, 4, 5, 10.00),
(5, 5, 5, 1, 25.00),
(6, 6, 6, 2, 18.00),
(7, 7, 7, 1, 50.00),
(8, 8, 8, 3, 12.00),
(9, 9, 9, 2, 22.00),
(10, 10, 10, 1, 45.00);

-- Inserting data into the ShoppingCarts table
INSERT INTO ShoppingCarts (CartID, CustomerID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Inserting data into the CartItems table
INSERT INTO CartItems (CartItemID, CartID, ProductID, Quantity) VALUES
(1, 1, 3, 1),
(2, 2, 4, 2),
(3, 3, 5, 1),
(4, 4, 6, 3),
(5, 5, 7, 1),
(6, 6, 8, 2),
(7, 7, 9, 1),
(8, 8, 10, 1),
(9, 9, 1, 2),
(10, 10, 2, 1);

-- Inserting data into the Payments table
INSERT INTO Payments (PaymentID, OrderID, PaymentMethod, Amount, CreationTimestamp) VALUES
(1, 1, 'Credit', 150.00, '2023-01-01 10:05:00'),
(2, 2, 'Debit', 70.00, '2023-01-02 11:35:00'),
(3, 3, 'PayPal', 200.00, '2023-01-03 14:05:00'),
(4, 4, 'Credit', 300.00, '2023-01-04 09:35:00'),
(5, 5, 'Debit', 120.00, '2023-01-05 12:50:00'),
(6, 6, 'PayPal', 80.00, '2023-01-06 15:05:00'),
(7, 7, 'Credit', 250.00, '2023-01-07 17:35:00'),
(8, 8, 'Debit', 190.00, '2023-01-08 13:05:00'),
(9, 9, 'PayPal', 140.00, '2023-01-09 16:20:00'),
(10, 10, 'Credit', 210.00, '2023-01-10 11:05:00');

-- Inserting data into the Reviews table
INSERT INTO Reviews (ReviewID, ProductID, CustomerID, Rating, Comment) VALUES
(1, 1, 1, 5, 'Amazing quality!'),
(2, 2, 2, 4, 'Really good, but a bit expensive.'),
(3, 3, 3, 5, 'Excellent! Works perfectly.'),
(4, 4, 4, 3, 'It’s okay, not what I expected.'),
(5, 5, 5, 4, 'Good, but could be thicker.'),
(6, 6, 6, 5, 'My cats love these!'),
(7, 7, 7, 2, 'Not very interesting.'),
(8, 8, 8, 5, 'Fantastic read! Highly recommend!'),
(9, 9, 9, 4, 'Great colors, but dries slowly.'),
(10, 10, 10, 3, 'Nice, but a bit dim.');

-- Inserting data into the Addresses table
INSERT INTO Addresses (AddressID, CustomerID, AddressLine, City, State, ZipCode, Country, IsBillingAddress, IsShippingAddress) VALUES
(1, 1, '123 Apple St', 'Pleasantville', 'CA', '12345', 'USA', 1, 1),
(2, 2, '456 Orange Ave', 'Laketown', 'MI', '23456', 'USA', 1, 0),
(3, 3, '789 Banana Blvd', 'Hilltop', 'OR', '34567', 'USA', 0, 1),
(4, 4, '135 Peach Path', 'Riverside', 'TX', '45678', 'USA', 1, 1),
(5, 5, '246 Grape Ln', 'Brookside', 'NY', '56789', 'USA', 1, 0),
(6, 6, '579 Cherry Rd', 'Lakeshore', 'FL', '67890', 'USA', 0, 1),
(7, 7, '468 Lime Ct', 'Seaside', 'WA', '78901', 'USA', 1, 1),
(8, 8, '987 Kiwi Cres', 'Mountainview', 'CO', '89012', 'USA', 1, 0),
(9, 9, '654 Melon Way', 'Valleytown', 'AZ', '90123', 'USA', 0, 1),
(10, 10, '321 Berry St', 'Bayside', 'SC', '01234', 'USA', 1, 1);


-- Inserting data into the Inventory table
INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate, ReorderThreshold, UnitCost) VALUES
(1, 1, 25, '2023-01-01 09:00:00', 5, 7.00),
(2, 2, 30, '2023-01-02 09:00:00', 10, 12.00),
(3, 3, 20, '2023-01-03 09:00:00', 5, 18.00),
(4, 4, 50, '2023-01-04 09:00:00', 15, 6.00),
(5, 5, 15, '2023-01-05 09:00:00', 5, 12.00),
(6, 6, 40, '2023-01-06 09:00:00', 10, 9.00),
(7, 7, 25, '2023-01-07 09:00:00', 5, 30.00),
(8, 8, 60, '2023-01-08 09:00:00', 20, 6.00),
(9, 9, 20, '2023-01-09 09:00:00', 5, 14.00),
(10, 10, 15, '2023-01-10 09:00:00', 5, 25.00);

SELECT Sellers.SellerID, Sellers.Name, SUM(Orders.TotalAmount) AS TotalSales
FROM Sellers
JOIN Products ON Sellers.SellerID = Products.SellerID
JOIN OrderItems ON Products.ProductID = OrderItems.ProductID
JOIN Orders ON OrderItems.OrderID = Orders.OrderID
GROUP BY Sellers.SellerID, Sellers.Name;



SELECT I.ProductID, P.Name, I.QuantityInStock
FROM Inventory I
JOIN Products P ON I.ProductID = P.ProductID
WHERE I.QuantityInStock <= I.ReorderThreshold;



SELECT TOP 10 Orders.OrderID, Orders.OrderNumber, Orders.CreationTimestamp, Orders.TotalAmount
FROM Orders
WHERE Orders.CustomerID = 12 
ORDER BY Orders.CreationTimestamp DESC;

SELECT Category, COUNT(*) AS ProductCount
FROM Products
GROUP BY Category;


SELECT TOP 5
    Customers.CustomerID, 
    Customers.Name, 
    SUM(Orders.TotalAmount) AS TotalSpent
FROM 
    Customers
JOIN 
    Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY 
    Customers.CustomerID, 
    Customers.Name
ORDER BY 
    TotalSpent DESC;

SELECT 
    P.ProductID,
    P.Name,
    AVG(R.Rating) AS AverageRating
FROM 
    Products P
JOIN 
    Reviews R ON P.ProductID = R.ProductID
GROUP BY 
    P.ProductID, 
    P.Name
ORDER BY 
    AverageRating DESC;


SELECT 
    CustomerID, 
    CAST(CreationTimestamp AS DATE) AS OrderDate, 
    COUNT(*) AS NumberOfPurchases
FROM 
    Orders
GROUP BY 
    CustomerID, 
    CAST(CreationTimestamp AS DATE)
HAVING 
    COUNT(*) > 1;


SELECT 
    P.Category, 
    SUM(OI.Quantity * OI.CurrentPrice) AS TotalRevenue
FROM 
    OrderItems OI
JOIN 
    Products P ON OI.ProductID = P.ProductID
GROUP BY 
    P.Category;


SELECT 
    C.CustomerID,
    C.Name
FROM 
    Customers C
LEFT JOIN 
    Reviews R ON C.CustomerID = R.CustomerID
WHERE 
    R.ReviewID IS NULL;



WITH AverageQuantity AS (
    SELECT AVG(QuantityInStock) AS AvgQuantity
    FROM Inventory
)
SELECT 
    P.ProductID,
    P.Name,
    I.QuantityInStock
FROM 
    Products P
JOIN 
    Inventory I ON P.ProductID = I.ProductID
JOIN 
    AverageQuantity ON I.QuantityInStock < AverageQuantity.AvgQuantity;


SELECT 
    CustomerID,
    COUNT(OrderID) AS TotalOrders
FROM 
    Orders
GROUP BY 
    CustomerID
HAVING 
    COUNT(OrderID) > 5;


SELECT TOP 3 
    OrderID, 
    OrderNumber, 
    CreationTimestamp, 
    TotalAmount
FROM 
    Orders
WHERE 
    CustomerID = 12 
ORDER BY 
    CreationTimestamp DESC;


SELECT 
    C.CustomerID,
    C.Name
FROM 
    Customers C
JOIN 
    Orders O ON C.CustomerID = O.CustomerID
JOIN 
    OrderItems OI ON O.OrderID = OI.OrderID
JOIN 
    Products P ON OI.ProductID = P.ProductID
GROUP BY 
    C.CustomerID, 
    C.Name
HAVING 
    COUNT(DISTINCT P.SellerID) >= 2;


SELECT DISTINCT
    C.CustomerID,
    C.Name
FROM 
    Customers C
JOIN 
    Orders O ON C.CustomerID = O.CustomerID
WHERE 
    O.CreationTimestamp >= DATEADD(day, -30, GETDATE());


-- SQL Server syntax
WITH CustomerCategories AS (
    SELECT 
        C.CustomerID, 
        COUNT(DISTINCT P.Category) AS CategoriesPurchased
    FROM 
        Customers C
    JOIN Orders O ON C.CustomerID = O.CustomerID
    JOIN OrderItems OI ON O.OrderID = OI.OrderID
    JOIN Products P ON OI.ProductID = P.ProductID
    GROUP BY 
        C.CustomerID
), 
TotalCategories AS (
    SELECT 
        COUNT(DISTINCT Category) AS TotalCategories
    FROM 
        Products
)
SELECT
    CC.CustomerID,
    CC.CategoriesPurchased,
    TC.TotalCategories
FROM
    CustomerCategories CC
CROSS JOIN
    TotalCategories TC;

WITH CustomerCategories AS (
    SELECT 
        C.CustomerID, 
        COUNT(DISTINCT P.Category) AS CategoriesPurchased
    FROM 
        Customers C
    JOIN Orders O ON C.CustomerID = O.CustomerID
    JOIN OrderItems OI ON O.OrderID = OI.OrderID
    JOIN Products P ON OI.ProductID = P.ProductID
    GROUP BY 
        C.CustomerID
), 
TotalCategories AS (
    SELECT 
        COUNT(DISTINCT Category) AS TotalCategories
    FROM 
        Products
)

SELECT 
    CC.CustomerID,
    C.Name
FROM 
    CustomerCategories CC
JOIN 
    Customers C ON CC.CustomerID = C.CustomerID
CROSS JOIN 
    TotalCategories
WHERE 
    CC.CategoriesPurchased = TotalCategories.TotalCategories;


SELECT 
    P.SellerID, 
    S.Name AS SellerName, -- Assuming there's a Name field in Sellers table
    COUNT(OI.ProductID) AS TotalProductsSold
FROM 
    Products P
JOIN 
    OrderItems OI ON P.ProductID = OI.ProductID
JOIN 
    Sellers S ON P.SellerID = S.SellerID -- If you have a Sellers table and it has a Name field
GROUP BY 
    P.SellerID, 
    S.Name;


-- SQL Server syntax
SELECT TOP 5
    P.ProductID,
    P.Name,
    SUM(OI.Quantity) AS TotalQuantitySold,
    SUM(OI.Quantity * OI.CurrentPrice) AS TotalSales
FROM 
    Products P
JOIN 
    OrderItems OI ON P.ProductID = OI.ProductID
JOIN 
    Orders O ON OI.OrderID = O.OrderID
WHERE 
    O.CreationTimestamp >= DATEADD(MONTH, -1, GETDATE())
GROUP BY 
    P.ProductID, 
    P.Name
ORDER BY 
    TotalSales DESC;


-- SQL Server syntax
WITH LatestOrders AS (
    SELECT TOP 5 
        O.OrderID,
        O.CreationTimestamp,
        C.CustomerID,
        C.Name AS CustomerName,
        C.Email AS CustomerEmail
    FROM 
        Orders O
    JOIN 
        Customers C ON O.CustomerID = C.CustomerID
    ORDER BY 
        O.CreationTimestamp DESC
)
SELECT 
    LO.OrderID,
    LO.CreationTimestamp,
    LO.CustomerID,
    LO.CustomerName,
    LO.CustomerEmail,
    OI.ProductID,
    P.Name AS ProductName,
    OI.Quantity,
    OI.CurrentPrice
FROM 
    LatestOrders LO
JOIN 
    OrderItems OI ON LO.OrderID = OI.OrderID
JOIN 
    Products P ON OI.ProductID = P.ProductID
ORDER BY 
    LO.CreationTimestamp DESC, 
    LO.OrderID, 
    OI.ProductID;


-- SQL Server syntax
WITH CustomerCategories AS (
    SELECT 
        C.CustomerID, 
        C.Name,
        COUNT(DISTINCT P.Category) AS CategoriesPurchased
    FROM 
        Customers C
    JOIN Orders O ON C.CustomerID = O.CustomerID
    JOIN OrderItems OI ON O.OrderID = OI.OrderID
    JOIN Products P ON OI.ProductID = P.ProductID
    GROUP BY 
        C.CustomerID,
        C.Name
), 
TotalCategories AS (
    SELECT 
        COUNT(DISTINCT Category) AS TotalCategories
    FROM 
        Products
)
SELECT 
    CC.CustomerID,
    CC.Name,
    CC.CategoriesPurchased
FROM 
    CustomerCategories CC
JOIN 
    TotalCategories TC ON 1=1; 



-- SQL Server syntax
WITH CategoryRatings AS (
    SELECT 
        P.Category, 
        AVG(R.Rating) AS AvgRating
    FROM 
        Products P
    JOIN 
        Reviews R ON P.ProductID = R.ProductID
    GROUP BY 
        P.Category
), 
UnreviewedProducts AS (
    SELECT 
        P.ProductID,
        P.Name,
        P.Category,
        I.QuantityInStock
    FROM 
        Products P
    JOIN 
        Inventory I ON P.ProductID = I.ProductID
    LEFT JOIN 
        Reviews R ON P.ProductID = R.ProductID
    WHERE 
        R.ReviewID IS NULL AND I.QuantityInStock > 0
)
SELECT 
    UP.ProductID,
    UP.Name,
    UP.Category,
    CR.AvgRating,
    UP.QuantityInStock
FROM 
    UnreviewedProducts UP
JOIN 
    CategoryRatings CR ON UP.Category = CR.Category;



-- SQL Server syntax
WITH TotalSales AS (
    SELECT 
        P.ProductID, 
        P.Name AS ProductName,
        SUM(OI.Quantity * OI.CurrentPrice) AS TotalSales
    FROM 
        Products P
    JOIN 
        OrderItems OI ON P.ProductID = OI.ProductID
    JOIN 
        Orders O ON OI.OrderID = O.OrderID
    GROUP BY 
        P.ProductID, 
        P.Name
), 
TopProducts AS (
    SELECT TOP 3 
        ProductID, 
        ProductName, 
        TotalSales
    FROM 
        TotalSales
    ORDER BY 
        TotalSales DESC
)
SELECT 
    TP.ProductID,
    TP.ProductName,
    TP.TotalSales,
    R.ReviewID,
    R.Rating,
    R.Comment
FROM 
    TopProducts TP
LEFT JOIN 
    Reviews R ON TP.ProductID = R.ProductID
ORDER BY 
    TP.TotalSales DESC;

	

-- SQL Server syntax
SELECT 
    C.CustomerID,
    C.Name AS CustomerName,
    C.Email AS CustomerEmail,
    O.OrderID,
    O.OrderNumber,
    O.CreationTimestamp,
    O.TotalAmount,
    OI.OrderItemID,
    OI.ProductID,
    P.Name AS ProductName,
    OI.Quantity,
    OI.CurrentPrice,
    A.AddressID,
    A.AddressLine,
    A.City,
    A.State,
    A.ZipCode,
    A.Country
FROM 
    Orders O
LEFT JOIN 
    Customers C ON O.CustomerID = C.CustomerID
LEFT JOIN 
    OrderItems OI ON O.OrderID = OI.OrderID
LEFT JOIN 
    Products P ON OI.ProductID = P.ProductID
LEFT JOIN 
    Addresses A ON O.OrderID = A.OrderID AND A.IsShippingAddress = 1 -- assuming 1 is true
ORDER BY 
    O.CreationTimestamp DESC, 
    O.OrderID, 
    OI.OrderItemID;



-- SQL Server syntax
SELECT 
    P.Category,
    COUNT(DISTINCT P.ProductID) AS TotalNumberOfProducts,
    ISNULL(SUM(OI.Quantity * OI.CurrentPrice), 0) AS TotalRevenue
FROM 
    Products P
LEFT JOIN 
    OrderItems OI ON P.ProductID = OI.ProductID
LEFT JOIN 
    Orders O ON OI.OrderID = O.OrderID
GROUP BY 
    P.Category
ORDER BY 
    TotalRevenue DESC;



-- SQL Server syntax
SELECT 
    P.ProductID,
    P.Name AS ProductName,
    P.Category AS ProductCategory,
    ISNULL(SUM(OI.Quantity), 0) AS OrderQuantity,
    ISNULL(AVG(OI.CurrentPrice), 0) AS AverageOrderPrice,
    ISNULL(SUM(OI.Quantity * OI.CurrentPrice), 0) AS TotalRevenue
FROM 
    Products P
LEFT JOIN 
    OrderItems OI ON P.ProductID = OI.ProductID
LEFT JOIN 
    Orders O ON OI.OrderID = O.OrderID
WHERE 
    P.Category = 'Electronics' AND (OI.Quantity BETWEEN 5 AND 10 OR OI.Quantity IS NULL)
GROUP BY 
    P.ProductID, 
    P.Name, 
    P.Category
ORDER BY 
    TotalRevenue DESC;



-- SQL Server syntax
SELECT 
    P.Category,
    SUM(OI.Quantity) AS TotalProductsSold
FROM 
    Products P
JOIN 
    OrderItems OI ON P.ProductID = OI.ProductID
-- If you need to consider only completed or certain status orders, 
-- join with Orders table and add the necessary conditions in WHERE clause
-- JOIN 
--     Orders O ON OI.OrderID = O.OrderID
-- WHERE 
--     O.Status = 'Completed' -- for example
GROUP BY 
    P.Category
HAVING 
    SUM(OI.Quantity) > 10
ORDER BY 
    TotalProductsSold DESC;


-- SQL Server syntax
SELECT 
    C.CustomerID,
    C.Name AS CustomerName,
    COUNT(O.OrderID) AS TotalOrdersPlaced
FROM 
    Customers C
JOIN 
    Orders O ON C.CustomerID = O.CustomerID
GROUP BY 
    C.CustomerID,
    C.Name
HAVING 
    COUNT(O.OrderID) > 5
ORDER BY 
    TotalOrdersPlaced DESC;
