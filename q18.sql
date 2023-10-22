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


