
WITH CustomerCategories AS (
    SELECT 
        C.CustomerID, 
        COUNT(DISTINCT P.Category) AS CategoriesPurchased
    FROM 
        Customers C
    JOIN Orders O ON C.CustomerID = O.CustomerID
    JOIN OrderItems OI ON O.OrderID = OI.OrderID
    JOIN Products P ON OI.ProductID = P.ProductID
    GROUP BY 
        C.CustomerID
), 
TotalCategories AS (
    SELECT 
        COUNT(DISTINCT Category) AS TotalCategories
    FROM 
        Products
)
SELECT
    CC.CustomerID,
    CC.CategoriesPurchased,
    TC.TotalCategories
FROM
    CustomerCategories CC
CROSS JOIN
    TotalCategories TC;

WITH CustomerCategories AS (
    SELECT 
        C.CustomerID, 
        COUNT(DISTINCT P.Category) AS CategoriesPurchased
    FROM 
        Customers C
    JOIN Orders O ON C.CustomerID = O.CustomerID
    JOIN OrderItems OI ON O.OrderID = OI.OrderID
    JOIN Products P ON OI.ProductID = P.ProductID
    GROUP BY 
        C.CustomerID
), 
TotalCategories AS (
    SELECT 
        COUNT(DISTINCT Category) AS TotalCategories
    FROM 
        Products
)

SELECT 
    CC.CustomerID,
    C.Name
FROM 
    CustomerCategories CC
JOIN 
    Customers C ON CC.CustomerID = C.CustomerID
CROSS JOIN 
    TotalCategories
WHERE 
    CC.CategoriesPurchased = TotalCategories.TotalCategories;


SELECT 
    P.SellerID, 
    S.Name AS SellerName, 
    COUNT(OI.ProductID) AS TotalProductsSold
FROM 
    Products P
JOIN 
    OrderItems OI ON P.ProductID = OI.ProductID
JOIN 
    Sellers S ON P.SellerID = S.SellerID
GROUP BY 
    P.SellerID, 
    S.Name;


