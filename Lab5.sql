USE AdventureWorksLT

-- Challenge1 : Retrieve product information

--1
SELECT P.ProductId, 
	   UPPER(P.Name) AS [Name],
	   ROUND(P.Weight, 0) AS ApproxWeight
FROM SalesLT.Product AS P