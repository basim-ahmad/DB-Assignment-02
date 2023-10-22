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
