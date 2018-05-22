USE AdventureWorksLT

-- Challenge1 : Retrieve customers addresses

SELECT
	C.CompanyName AS Name
   ,A.AddressLine1 AS Address
   ,A.City AS City
   ,'Billing' AS AddressType
FROM SalesLT.CustomerAddress AS CA
INNER JOIN SalesLT.Customer AS C
	ON CA.CustomerID = C.CustomerID
INNER JOIN SalesLT.Address AS A
	ON CA.AddressID = A.AddressID
WHERE CA.AddressType = 'Main Office'
UNION
SELECT
	C.CompanyName AS Name
   ,A.AddressLine1 AS Address
   ,A.City AS City
   ,CA.AddressType AS AddressType
FROM SalesLT.CustomerAddress AS CA
INNER JOIN SalesLT.Customer AS C
	ON CA.CustomerID = C.CustomerID
INNER JOIN SalesLT.Address AS A
	ON CA.AddressID = A.AddressID
WHERE CA.AddressType = 'Shipping'
ORDER BY Name, AddressType

--Challenge 2 Filter Customer Addresses

--1
SELECT
	C.CompanyName AS Name
FROM SalesLT.CustomerAddress AS CA
INNER JOIN SalesLT.Customer AS C
	ON CA.CustomerID = C.CustomerID
WHERE CA.AddressType = 'Main Office'
EXCEPT
SELECT
	C.CompanyName AS Name
FROM SalesLT.CustomerAddress AS CA
INNER JOIN SalesLT.Customer AS C
	ON CA.CustomerID = C.CustomerID
WHERE CA.AddressType = 'Shipping'
ORDER BY Name

--2
SELECT
	C.CompanyName AS Name
FROM SalesLT.CustomerAddress AS CA
INNER JOIN SalesLT.Customer AS C
	ON CA.CustomerID = C.CustomerID
WHERE CA.AddressType = 'Main Office'
INTERSECT
SELECT
	C.CompanyName AS Name
FROM SalesLT.CustomerAddress AS CA
INNER JOIN SalesLT.Customer AS C
	ON CA.CustomerID = C.CustomerID
WHERE CA.AddressType = 'Shipping'
ORDER BY Name