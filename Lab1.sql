--Challenge 1: Retrieve Customer Data

-- 1
SELECT * FROM SalesLT.Customer

--2
SELECT Title, 
	   FirstName,
	   MiddleName,
	   LastName,
	   Suffix
FROM SalesLT.Customer AS C

--3
SELECT 
	   FirstName,
	   MiddleName,
	   LastName,
	   C.Phone
FROM SalesLT.Customer AS C

--Challenge 2: Retrieve Customer and Sales Data

--1 
SELECT CONCAT(CustomerID,':',CompanyName) FROM SalesLT.Customer

--2
SELECT CONCAT(SalesOrderNumber,'(',RevisionNumber,')') AS OrderNumber
	  ,CONVERT(DATE, OrderDate, 102) AS OrderDate
FROM SalesLT.SalesOrderHeader

--Challenge3: Retrieve Customer Contact Detail

--1
SELECT ISNULL(FirstName,'') + ' ' + ISNULL(MiddleName,'') + ' ' + ISNULL(LastName,'') AS [Name]
FROM SalesLT.Customer

--2
SELECT CustomerID
	   , IIF(EmailAddress IS NOT NULL, EmailAddress, Phone) AS PrimaryContact
FROM SalesLT.Customer

--3
SELECT SalesOrderID AS ID
	   ,ShipDate AS ShipDate
	   ,IIF(ShipDate IS NOT NULL, 'Shipped', 'Awaiting shipment') AS ShippingStatus
FROM SalesLT.SalesOrderHeader