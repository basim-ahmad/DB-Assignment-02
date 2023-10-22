SELECT TOP 10 Orders.OrderID, Orders.OrderNumber, Orders.CreationTimestamp, Orders.TotalAmount
FROM Orders
WHERE Orders.CustomerID = 12 
ORDER BY Orders.CreationTimestamp DESC;
