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



