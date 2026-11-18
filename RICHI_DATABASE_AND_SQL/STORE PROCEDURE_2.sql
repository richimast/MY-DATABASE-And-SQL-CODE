USE AdventureWorks2017;
GO

CREATE PROCEDURE dbo.uspGetAddress2 @City nvarchar(30)
AS

SELECT * FROM Person.Address
WHERE City Like @City + '%'
GO

EXEC dbo.uspGetAddress2 @City = 'New'