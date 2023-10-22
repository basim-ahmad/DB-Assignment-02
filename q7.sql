SELECT TOP 5
    Customers.CustomerID, 
    Customers.Name, 
    SUM(Orders.TotalAmount) AS TotalSpent
FROM 
    Customers
JOIN 
    Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY 
    Customers.CustomerID, 
    Customers.Name
ORDER BY 
    TotalSpent DESC;

