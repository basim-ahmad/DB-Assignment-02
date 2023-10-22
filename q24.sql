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

