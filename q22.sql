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

	
