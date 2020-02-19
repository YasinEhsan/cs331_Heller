USE Northwinds2019TSQLV5
SELECT C.CustomerId, C.CustomerCompanyName, O.OrderDate, o.OrderId
FROM Sales.Customer AS C
  LEFT OUTER JOIN Sales.[Order] AS O
    ON O.CustomerId = C.CustomerId;

-- 5
SELECT C.CustomerId, C.CustomerCompanyName
FROM Sales.Customer AS C
  LEFT OUTER JOIN Sales.[Order] AS O
    ON O.CustomerId = C.CustomerId
WHERE O.OrderId IS NULL;

-- 6
SELECT C.CustomerId, C.CustomerCompanyName, O.OrderDate, o.OrderId
FROM Sales.Customer AS C
  INNER JOIN Sales.[Order] AS O
    ON O.CustomerId = C.CustomerId
WHERE O.OrderDate = '20160212';
