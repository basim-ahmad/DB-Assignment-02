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


