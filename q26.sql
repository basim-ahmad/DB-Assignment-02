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
