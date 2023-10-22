SELECT 
    C.CustomerID,
    C.Name
FROM 
    Customers C
LEFT JOIN 
    Reviews R ON C.CustomerID = R.CustomerID
WHERE 
    R.ReviewID IS NULL;



