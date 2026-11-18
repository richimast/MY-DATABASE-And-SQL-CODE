USE AdventureWorks2017
GO

CREATE PROC dbo.uspGetAddress3 @City nvarchar(30), @PostalCode nvarchar(10)
AS
SELECT*FROM Person.Address
WHERE City Like @City + '%' AND PostalCode Like @PostalCode
GO
EXEC dbo.uspGetAddress3 @City = 'New', @PostalCode = '[98]%'