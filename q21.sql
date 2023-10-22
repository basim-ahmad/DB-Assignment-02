WITH CategoryRatings AS (
    SELECT 
        P.Category, 
        AVG(R.Rating) AS AvgRating
    FROM 
        Products P
    JOIN 
        Reviews R ON P.ProductID = R.ProductID
    GROUP BY 
        P.Category
), 
UnreviewedProducts AS (
    SELECT 
        P.ProductID,
        P.Name,
        P.Category,
        I.QuantityInStock
    FROM 
        Products P
    JOIN 
        Inventory I ON P.ProductID = I.ProductID
    LEFT JOIN 
        Reviews R ON P.ProductID = R.ProductID
    WHERE 
        R.ReviewID IS NULL AND I.QuantityInStock > 0
)
SELECT 
    UP.ProductID,
    UP.Name,
    UP.Category,
    CR.AvgRating,
    UP.QuantityInStock
FROM 
    UnreviewedProducts UP
JOIN 
    CategoryRatings CR ON UP.Category = CR.Category;



