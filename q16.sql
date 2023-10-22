SELECT DISTINCT
    C.CustomerID,
    C.Name
FROM 
    Customers C
JOIN 
    Orders O ON C.CustomerID = O.CustomerID
WHERE 
    O.CreationTimestamp >= DATEADD(day, -30, GETDATE());


