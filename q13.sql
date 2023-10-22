SELECT 
    CustomerID,
    COUNT(OrderID) AS TotalOrders
FROM 
    Orders
GROUP BY 
    CustomerID
HAVING 
    COUNT(OrderID) > 5;


