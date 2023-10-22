WITH CustomerCategories AS (
    SELECT 
        C.CustomerID, 
        C.Name,
        COUNT(DISTINCT P.Category) AS CategoriesPurchased
    FROM 
        Customers C
    JOIN Orders O ON C.CustomerID = O.CustomerID
    JOIN OrderItems OI ON O.OrderID = OI.OrderID
    JOIN Products P ON OI.ProductID = P.ProductID
    GROUP BY 
        C.CustomerID,
        C.Name
), 
TotalCategories AS (
    SELECT 
        COUNT(DISTINCT Category) AS TotalCategories
    FROM 
        Products
)
SELECT 
    CC.CustomerID,
    CC.Name,
    CC.CategoriesPurchased
FROM 
    CustomerCategories CC
JOIN 
    TotalCategories TC ON 1=1; 



