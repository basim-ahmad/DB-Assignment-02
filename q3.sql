SELECT Sellers.SellerID, Sellers.Name, SUM(Orders.TotalAmount) AS TotalSales
FROM Sellers
JOIN Products ON Sellers.SellerID = Products.SellerID
JOIN OrderItems ON Products.ProductID = OrderItems.ProductID
JOIN Orders ON OrderItems.OrderID = Orders.OrderID
GROUP BY Sellers.SellerID, Sellers.Name;
