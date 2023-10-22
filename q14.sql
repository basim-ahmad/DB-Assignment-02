SELECT TOP 3 
    OrderID, 
    OrderNumber, 
    CreationTimestamp, 
    TotalAmount
FROM 
    Orders
WHERE 
    CustomerID = 12 
ORDER BY 
    CreationTimestamp DESC;


