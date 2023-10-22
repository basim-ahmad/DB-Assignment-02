SELECT 
    CustomerID, 
    CAST(CreationTimestamp AS DATE) AS OrderDate, 
    COUNT(*) AS NumberOfPurchases
FROM 
    Orders
GROUP BY 
    CustomerID, 
    CAST(CreationTimestamp AS DATE)
HAVING 
    COUNT(*) > 1;


