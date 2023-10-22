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
