WITH AverageQuantity AS (
    SELECT AVG(QuantityInStock) AS AvgQuantity
    FROM Inventory
)
SELECT 
    P.ProductID,
    P.Name,
    I.QuantityInStock
FROM 
    Products P
JOIN 
    Inventory I ON P.ProductID = I.ProductID
JOIN 
    AverageQuantity ON I.QuantityInStock < AverageQuantity.AvgQuantity;


