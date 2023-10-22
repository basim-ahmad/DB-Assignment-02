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


