USE Library_Management_System
GO

CREATE PROCEDURE GetCopies_Of_BookTitle_THE_LOST_TRIBE_OwnedBy_Sharpstown_Branch
	@BranchName varchar(255), @BookTitle varchar(255)
AS
BEGIN
	SELECT COUNT(BranchID) FROM Library_Branch WHERE BranchName = '@BranchName';

	SELECT COUNT(BookTitle) FROM BOOKS WHERE BookTitle = '@BookTitle';
END

