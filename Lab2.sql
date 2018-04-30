--Challenge 1: Retrieve Data for Transportation Report

--1
SELECT DISTINCT [City], [StateProvince]
FROM [SalesLT].[Address]

--2
SELECT TOP(10) PERCENT [Name], [Weight]
FROM [SalesLT].[Product]
ORDER BY [Weight] DESC

--3
SELECT [Name], [Weight]
FROM [SalesLT].[Product]
ORDER BY [Weight] DESC
OFFSET 10 ROWS FETCH NEXT 100 ROWS ONLY


--Challenge 2: Retrieve Product Data

--1
SELECT  [Name]
	   ,[Color]
	   ,[Size]
FROM [SalesLT].[Product]
WHERE [ProductModelID] = 1

--2
SELECT  [ProductNumber]
	   ,[Color]
	   ,[Size]
FROM [SalesLT].[Product]
WHERE [Color] IN ('Black', 'Red', 'White')
	  AND
	  [Size] IN ('S', 'M')

--3
SELECT [ProductNumber]
      ,[Name]
	  ,[ListPrice]
FROM [SalesLT].[Product]
WHERE LEFT([ProductNumber], 3) = 'BK-'

--4
SELECT [ProductNumber]
      ,[Name]
	  ,[ListPrice]
FROM [SalesLT].[Product]
WHERE [ProductNumber] LIKE '%BK-[^R]%' AND [ProductNumber] LIKE '%-[0-9][0-9]'