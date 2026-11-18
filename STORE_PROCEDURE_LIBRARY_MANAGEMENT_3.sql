USE [db_Library_Management_System]
GO
/****** Object:  StoredProcedure [dbo].[GetCopies_Of_BookTitle_THE_LOST_TRIBE_OwnedBy_Sharpstown_Branch]    Script Date: 18/11/2026 18:29:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetCopies_Of_BookTitle_THE_LOST_TRIBE_OwnedBy_Sharpstown_Branch]
	@BookTitle varchar, 
	@BranchName varchar(255)
AS
BEGIN
    
	SELECT COUNT(BookTitle) FROM BOOKS WHERE BookTitle = 'The Lost Tribe';

	SELECT COUNT(BranchID) FROM Library_Branch WHERE BranchName = 'Sharpstown'
END;