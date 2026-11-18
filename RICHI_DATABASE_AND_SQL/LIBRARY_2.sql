USE Library_Management_System
GO

EXEC [dbo].[GetCopies_Of_BookTitle_THE_LOST_TRIBE_OwnedBy_Sharpstown_Branch]
	@BranchName = 'Sharpstown', @BookTitle = 'The Lost Tribe';