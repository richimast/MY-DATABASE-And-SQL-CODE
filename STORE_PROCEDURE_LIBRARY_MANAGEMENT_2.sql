USE [db_Library_Management_System]
GO
/****** Object:  StoredProcedure [dbo].[Getcopies_Of_Book_Titled_THE_LOST_TRIBE_Owned_By_Each_Library_Branch]    Script Date: 18/11/2026 18:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Getcopies_Of_Book_Titled_THE_LOST_TRIBE_Owned_By_Each_Library_Branch]
	@BranchID INT,
	@BookTitle varchar(255)
AS
BEGIN
	
	SELECT COUNT(Number_Of_Copies) FROM BookCopies WHERE BranchID = '10';

	SELECT COUNT(BranchName) FROM BOOKS, Library_Branch WHERE BookTitle  = 'The lost Tribe';

	SELECT BOOKS.BookTitle, Library_Branch.BranchName FROM BOOKS, Library_Branch WHERE BookTitle = 'The Lost Tribe';
END;