SELECT 
    P.Category, 
    SUM(OI.Quantity * OI.CurrentPrice) AS TotalRevenue
FROM 
    OrderItems OI
JOIN 
    Products P ON OI.ProductID = P.ProductID
GROUP BY 
    P.Category;


