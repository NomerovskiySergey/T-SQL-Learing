USE AdventureWorksLT
-- Challenge 1: Generate Invoice Reports

SELECT DISTINCT C.CompanyName
			    ,SOH.SalesOrderID
			    ,SOH.TotalDue
			    ,CONCAT(A.AddressLine1,' ', A.AddressLine2, ' ', A.City, ' ', A.StateProvince, ' ', A.CountryRegion, ' ', A.PostalCode) AS FullAddress
FROM SalesLT.Customer AS C
INNER JOIN SalesLT.SalesOrderHeader AS SOH ON C.CustomerID = SOH.CustomerID
INNER JOIN SalesLT.CustomerAddress AS CA ON C.CustomerID = CA.CustomerID AND CA.AddressType = 'Main Office'
INNER JOIN SalesLT.Address AS A ON A.AddressID = CA.AddressID

--Challenge 2: Retrieve Sales Data

--1 Retrieve a list of all customers and their orders
SELECT C.FirstName
      ,C.LastName
	  ,SOH.SalesOrderID
	  ,SOH.TotalDue
FROM SalesLT.Customer AS C
LEFT JOIN SalesLT.SalesOrderHeader AS SOH ON C.CustomerID = SOH.CustomerID
ORDER BY SOH.TotalDue DESC

--2 Retrieve a list of customers with no address
SELECT C.CustomerID 
	  ,C.FirstName
      ,C.LastName
	  ,C.CompanyName
	  ,C.Phone
FROM SalesLT.Customer AS C
LEFT JOIN SalesLT.CustomerAddress AS CA ON C.CustomerID = CA.CustomerID
WHERE CA.CustomerID IS NULL

--3 Retrieve a list of customers and products without orders
SELECT C.CustomerID AS CustomerId,
	   NULL AS ProductId
FROM SalesLT.Customer AS C
LEFT JOIN SalesLT.SalesOrderHeader AS SOH ON C.CustomerID = SOH.CustomerID
WHERE SOH.SalesOrderID IS NULL
UNION
SELECT NULL AS CustomerId,
	   P.ProductID AS ProductId
FROM SalesLT.Product AS P
LEFT JOIN SalesLT.SalesOrderDetail AS SOD ON P.ProductID = SOD.ProductID
WHERE SOD.ProductID IS NULL