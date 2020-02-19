-- FIRSTT
SELECT E.EmployeeId, E.EmployeeFirstName, E.EmployeeLastName, N.n
FROM HumanResources.Employee AS E
  CROSS JOIN dbo.Nums AS N
WHERE N.n <= 5
ORDER BY n, EmployeeId;

-- 2

SELECT C.CustomerId, C.CustomerCompanyName, O.OrderId, O.OrderDate
FROM Sales.Customer AS C
  INNER JOIN Sales.[Order] AS O
    ON C.CustomerId = O.CustomerId;

-- 3
SELECT C.CustomerId, COUNT(DISTINCT O.OrderId) AS numorders, SUM(OD.Quantity) AS totalqty
FROM Sales.Customer AS C
  INNER JOIN Sales.[Order] AS O
    ON O.CustomerId = C.CustomerId
  INNER JOIN Sales.OrderDetail AS OD
    ON OD.orderid = O.OrderId
WHERE C.CustomerCountry = N'USA'
GROUP BY C.CustomerId;

-- 4
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
