USE AdventureWorks2022

SELECT * FROM SYS.TABLES

--GROUP BY CLAUSE PRACTICE PROBLEMS

-- 1.IN THE PERSON.PERSON TABLE ,HOW MANY PEOPLE ARE ASSOCIATED WITH EACH PERSONTYPE?
SELECT PersonType,COUNT(Person.BusinessEntityID) AS NUM_OF_PERSON FROM Person.Person GROUP BY PersonType  

-- 2.USING ONLY ONE QUERY , FIND OUT HOW MANY PRODUCTS IN Production.Product ARE THE COLOR "RED" AND HOW MANY ARE "BLACK"
SELECT Color,COUNT(ProductID) AS NUM_PRODUCT FROM Production.Product WHERE Color='Black' OR COLOR='Red' GROUP BY Color  

-- 3.USING Sales.SalesOrderHeader, HOW MANY SALES OCCURED IN EACH TERRITORY BETWEEN JULY 1,2005 AND DEC 31,2006?OREDER THE RESULTS BY THE SALE 
SELECT TerritoryID,COUNT(*) AS NUM FROM Sales.SalesOrderHeader WHERE OrderDate  BETWEEN '2005-01-07' AND '2006-12-31'  GROUP BY TerritoryID
ORDER BY NUM DESC

-- 4.Expanding on the previous example, group the results not by the TerritoryID but by the name of the territory (found in the Sales.SalesTerritory table).
SELECT Name,COUNT(*) AS NUM FROM Sales.SalesOrderHeader AS E INNER JOIN Sales.SalesTerritory AS D ON E.TerritoryID=D.TerritoryID 
WHERE OrderDate  BETWEEN '2005-01-07' AND '2006-12-31'  GROUP BY Name
ORDER BY NUM DESC

-- 5.Using the Book, BookAuthor, Author and/or Publisher tables, identify how many books each author either wrote or co-authored.
SELECT * FROM Book AS B JOIN BookAuthor AS BA ON B.Author=BA.Author ON Publisher AS P ON BA.Author = P.Author 

-- ORDER BY CLAUSE PRACTICE PROBLEMS
/*1) From the HumanResources.vEmployeeDepartment view, return the FirstName,LastName and JobTitle columns. Sort the results by the FirstName column in
ascending order.*/
SELECT FirstName,LastName , JobTitle FROM HumanResources.vEmployeeDepartment ORDER BY FirstName

/*2) Modify the query from question 1 to sort the results by the FirstName column in
ascending order and then by the LastName column in descending order.*/
SELECT FirstName,LastName , JobTitle FROM HumanResources.vEmployeeDepartment ORDER BY FirstName,LASTNAME DESC

/*3) From the Sales.vIndividualCustomer view, return the FirstName, LastName and
CountryRegionName columns. Sort the results by the CountryRegionName column.
Use the column ordinal in the ORDER BY clause.*/
SELECT FirstName, LastName ,CountryRegionName FROM Sales.vIndividualCustomer ORDER BY 3

/*4) From the Sales.vIndividualCustomer view, return the FirstName, LastName and
CountryRegionName columns for those rows with a CountryRegionName that is
either “United States” or “France”. Sort the results by the CountryRegionName
column in ascending order.*/
SELECT  FirstName, LastName ,CountryRegionName FROM Sales.vIndividualCustomer WHERE CountryRegionName ='United States'
OR CountryRegionName ='France' ORDER BY CountryRegionName 

/*5) From the Sales.vStoreWithDemographics view, return the Name, AnnualSales,
YearOpened, SquareFeet, and NumberEmployees columns. Give the SquareFeet
column the alias “Store Size” and the NumberEmployees column the alias “Total
Employees”. Return only those rows with AnnualSales greater than 1,000,000 and
with NumberEmployees greater than or equal to 45. Order your results by the
“Store Size” alias in descending order and then by the “Total Employees” alias in
descending order.*/
SELECT Name, AnnualSales,YearOpened,SquareFeet AS STORE_SIZE,NumberEmployees AS TOTAL_EMPLOYEES
FROM Sales.vStoreWithDemographics WHERE AnnualSales>1000000 AND NumberEmployees>=45 ORDER BY STORE_SIZE DESC,
TOTAL_EMPLOYEES DESC 

--6)FIND NUMBER OF EMPLOYEES BY GENDER IN HUMANRESOURCES..EMPLOYEE
SELECT Gender,COUNT(Gender) FROM HumanResources.Employee GROUP BY Gender

--7)COUNT NUMBER OF PRODUCTS BY PRODUCT LINE IN Production.Product
SELECT COUNT(*) FROM Production.Product

--HAVING CLAUSE PRACTICE 
-- 1.Find the total sales by territory for all rows in the Sales.SalesOrderHeader table. Return only those territories that have exceeded $10 million in historical sales. 
--   Return the total sales and the TerritoryID column.
SELECT TerritoryID,SUM(TotalDue) AS  [TOTAL SALES]  FROM Sales.SalesOrderHeader GROUP BY TerritoryID HAVING SUM(TotalDue)>10000000

SELECT * FROM Sales.SalesOrderHeader

-- 2.Using the query from the previous question, join to the Sales.SalesTerritory table
--   and replace the TerritoryID column with the territory’s name.
SELECT Name,SUM(TotalDue) AS  [TOTAL SALES]  FROM Sales.SalesOrderHeader SH JOIN Sales.SalesTerritory AS ST ON SH.TerritoryID=ST.TerritoryID
GROUP BY Name
HAVING SUM(TotalDue)>10000000

-- 3.Using the Production.Product table, find how many products are associated with
--   each color. Ignore all rows where the color has a NULL value. Once grouped, return
--   to the results only those colors that had at least 20 products with that color.





--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~PRESENTATION~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



SELECT Ord.SalesOrderID, Ord.OrderDate,
    (SELECT MAX(OrdDet.UnitPrice)
     FROM Sales.SalesOrderDetail AS OrdDet
     WHERE Ord.SalesOrderID = OrdDet.SalesOrderID) AS MaxUnitPrice
FROM Sales.SalesOrderHeader AS Ord;

select * from Sales.SalesOrderDetail

select * from Sales.SalesOrderHeader

SELECT [Name]
FROM Production.Product
WHERE ListPrice =
    (SELECT ListPrice
     FROM Production.Product
     WHERE [Name] = 'Chainring Bolts' );

	 select * from Production.product

	 --using join

SELECT Prd1.[Name]
FROM Production.Product AS Prd1
     JOIN Production.Product AS Prd2
       ON (Prd1.ListPrice = Prd2.ListPrice)
WHERE Prd2.[Name] = 'Chainring Bolts';

SELECT [Name]
FROM Sales.Store
WHERE BusinessEntityID NOT IN
    (SELECT CustomerID
     FROM Sales.Customer
     WHERE TerritoryID = 5);

	 select * from Sales.Store
	 select * from Sales.Customer


SELECT LastName, FirstName
FROM Person.Person
WHERE BusinessEntityID IN
    (SELECT BusinessEntityID
     FROM HumanResources.Employee
     WHERE BusinessEntityID IN
        (SELECT BusinessEntityID
         FROM Sales.SalesPerson))

	select * from Sales.SalesPerson
	select * from HumanResources.Employee
	select * from Person.Person