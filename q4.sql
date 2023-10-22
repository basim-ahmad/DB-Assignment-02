SELECT I.ProductID, P.Name, I.QuantityInStock
FROM Inventory I
JOIN Products P ON I.ProductID = P.ProductID
WHERE I.QuantityInStock <= I.ReorderThreshold;
