USE [db_Library_Management_System]
GO
/****** Object:  StoredProcedure [dbo].[Get_All_Borrowers_DateDue]    Script Date: 18/11/2026 18:24:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Get_All_Borrowers_DateDue]
	@DateDue DATE
AS
BEGIN

	SELECT Borrower.BorrowerName, BookLoans.DateDue FROM Borrower, BookLoans WHERE DateDue LIKE '2026-11-10%';

END;