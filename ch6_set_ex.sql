1.
-- Answer
-- The UNION ALL operator unifies the two input multisets and doesn’t
-- remove duplicates from the result. The UNION operator (implied DISTINCT)
-- also unifies the two input multisets, but does remove duplicates
-- from the result.
-- The two have different meanings when the result can potentially have duplicates.
-- They have an equivalent meaning when the result can’t have duplicates,
-- such as when you’re unifying disjoint sets (for example, sales 2015 with sales 2016).
-- When they do have the same meaning, it’s important to use UNION ALL by default.
-- That’s in order not to pay unnecessary performance penalties
-- for the work involved in removing duplicates when they don’t exist.

2.
SELECT 1 AS n
UNION ALL SELECT 2
UNION ALL SELECT 3
UNION ALL SELECT 4
UNION ALL SELECT 5
UNION ALL SELECT 6
UNION ALL SELECT 7
UNION ALL SELECT 8
UNION ALL SELECT 9
UNION ALL SELECT 10;

3.
SELECT CustomerId, EmployeeId
FROM Sales.[Order]
WHERE orderdate >= '20160101' AND orderdate < '20160201'
EXCEPT

SELECT CustomerId, EmployeeId
FROM Sales.[Order]
WHERE orderdate >= '20160201' AND orderdate < '20160301';

4.
SELECT CustomerID, EmployeeID
FROM Sales.[Order]
WHERE orderdate >= '20160101' AND orderdate < '20160201'

INTERSECT

SELECT CustomerID, EmployeeID
FROM Sales.[Order]
WHERE orderdate >= '20160201' AND orderdate < '20160301';

5.
SELECT CustomerID, EmployeeID
FROM Sales.[Order]
WHERE orderdate >= '20160101' AND orderdate < '20160201'

INTERSECT

SELECT CustomerID, EmployeeID
FROM Sales.[Order]
WHERE orderdate >= '20160201' AND orderdate < '20160301'

EXCEPT

SELECT CustomerID, EmployeeID
FROM Sales.[Order]
WHERE orderdate >= '20150101' AND orderdate < '20160101';

6.
SELECT EmployeeCountry, EmployeeRegion, EmployeeCity
FROM (SELECT 1 AS sortcol, EmployeeCountry, EmployeeRegion, EmployeeCity
FROM HumanResources.Employee

UNION ALL

SELECT 2, SupplierCountry, SupplierRegion, SupplierCity
FROM Production.Supplier) AS D
ORDER BY sortcol, EmployeeCountry, EmployeeRegion, EmployeeCity
