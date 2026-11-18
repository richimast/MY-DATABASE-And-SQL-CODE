USE AdventureWorks2017
GO

/*SQL statement containing the BETWEEN operator against the AdventureWorks database.*/
SELECT * FROM Sales.SalesTaxRate
WHERE TaxRate BETWEEN 10 AND 20;