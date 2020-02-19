-- CROSS JOINS
-- SQL-92
SELECT C.CustomerId, E.EmployeeId
FROM Sales.Customer AS C
  CROSS JOIN HumanResources.Employee AS E;

-- SQL-89
SELECT C.CustomerId, E.EmployeeId
FROM Sales.Customer AS C, HumanResources.Employee  AS E;

-- Self Cross-Join
SELECT
  E1.EmployeeId, E1.EmployeeFirstName, E1.EmployeeLastName,
   E2.EmployeeId, E2.EmployeeFirstName, E2.EmployeeLastName
FROM HumanResources.Employee AS E1
  CROSS JOIN HumanResources.Employee AS E2;
GO

-- All numbers from 1 - 1000

-- Auxiliary table of digits
-- USE TSQLV4;

DROP TABLE IF EXISTS dbo.Digits;

CREATE TABLE dbo.Digits(digit INT NOT NULL PRIMARY KEY);

INSERT INTO dbo.Digits(digit)
  VALUES (0),(1),(2),(3),(4),(5),(6),(7),(8),(9);

SELECT digit FROM dbo.Digits;
GO

-- All numbers from 1 - 1000
SELECT D3.digit * 100 + D2.digit * 10 + D1.digit + 1 AS n
FROM         dbo.Digits AS D1
  CROSS JOIN dbo.Digits AS D2
  CROSS JOIN dbo.Digits AS D3
ORDER BY n;
