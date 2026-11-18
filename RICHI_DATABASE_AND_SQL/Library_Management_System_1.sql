USE Library_Management_System_1
GO

/*Create Library Branch table with BranchID primary key, BranchName and BranchAddress columns*/
CREATE TABLE Library_Branch (
	BranchID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	BranchName varchar(255) NOT NULL,
	BranchAddress varchar(255) NOT NULL
);

/*Populate the Library_Branch table with six BranchNames and BranchAddress*/
INSERT INTO Library_Branch
(BranchName, BranchAddress)
VALUES
('Ashtown', '57 Street Podland'),
('BedStone', '35 Road Middlesex'),
('Manford Town', '18 Richardson Road'),
('Sharpstown', '45 Eric Street England'),
('Ransford Town', '135 Matthew Street Bedford'),
('Green Town', '67 Varonica Road Green Town');

SELECT * FROM Library_Branch;

/*Create Borrower table with CardNo primary key, BorrowerName, BorrowerAddress and PhoneNumber columns*/
CREATE TABLE Borrower (
	CardNo INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	BorrowerName varchar(255) NOT NULL,
	BorrowerAddress varchar(255) NOT NULL,
	PhoneNumber varchar(255) NOT NULL
);

/*Populate the Borrower table with eight BorrowerNames, BorrowerAddress and PhoneNumber*/
INSERT INTO Borrower
(BorrowerName, BorrowerAddress, PhoneNumber)
VALUES
('James Anderson', '12 Oak Street, London', '07700 900001'),
('Emily Johnson', '24 Park Road, Manchester', '07700 900002'),
('Michael Brown', '8 Victoria Avenue, Birmingham', '07700 900003'),
('Sarah Williams', '15 King Street, Leeds', '07700 900004'),
('Daniel Taylor',  '32 Church Road, Bristol', '07700 900005'),
('Olivia Thomas',  '7 Green Lane, Liverpool', '07700 900006'),
('William Davies', '19 High Street, Sheffield', '07700 900007'),
('Sophia Wilson', '45 Queen Road, Nottingham', '07700 900008');

SELECT * FROM Borrower;

/*Create Publisher table with PublisherName, PublisherAddress and PhoneNumber columns*/
CREATE TABLE Publisher (
	PublisherName varchar(255) NOT NULL,
	PublisherAddress varchar(255) NOT NULL,
	PhoneNumber varchar(255) NOT NULL
);
/*Populate the Publihser table with Ten PublisherNames, PublisherAddress and PhoneNumber*/
INSERT INTO Publisher
(PublisherName, PublisherAddress, PhoneNumber)
VALUES
('Benjamin Evans', '6 Rose Avenue, Cardiff', '07700 900009'),
('Charlotte Martin', '21 Mill Road, Oxford', '07700 900010'),
('Alexander White', '10 Station Road, York', '07700 900011'),
('Amelia Harris', '28 Church Street, Glasgow', '07700 900012'),
('Ethan Clark', '14 London Road, Leicester', '07700 900013'),
('Grace Lewis', '9 Meadow Lane, Coventry', '07700 900014'),
('Samuel Walker', '36 Victoria Street, Derby', '07700 900015'),
('Mia Hall', '17 Windsor Road, Chatham', '07700 900016'),
('Joseph Allen', '5 Albert Street, Newcastle', '07700 900017'),
('Isabella Young', '23 Castle Road, Brighton', '07700 900018');

SELECT * FROM Publisher;

/*Create BOOKS table with BookID primary key, BookTitle, PublisherName columns*/
CREATE TABLE BOOKS (
	BookID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	BookTitle varchar(255) NOT NULL,
	PublisherName varchar(255) NOT NULL
);
/*Populate the Books table with Ten PublisherNames, PublisherAddress and PhoneNumber*/
INSERT INTO BOOKS
(BookTitle, PublisherName)
VALUES
('The Secret of the Lost City', 'James Anderson'),
('A Journey Beyond the Stars', 'Emily Johnson'),
('The Power of Dreams', 'Michael Brown'),
('Whispers in the Dark', 'Sarah Williams'),
('The Last Kingdom', 'Daniel Taylor'),
('Love in the Rain', 'Olivia Thomas'),
('The Road to Success', 'Emily Johnson'),
('Secrets of the Ancient World', 'Michael Brown'),
('The Hidden Treasure', 'William Davies'),
('The Lost Tribe', 'Sophia Wilson'),
('A Life Worth Living', 'Olivia Thomas'),
('The Mystery of Blackwood House', 'Charlotte Martin'),
('Beyond the Mountains', 'Alexander White'),
('The Art of Happiness', 'Ethan Clark'),
('The Forgotten Princess', 'Amelia Harris'),
('Dreams of Tomorrow', 'Benjamin Evans'),
('The Silent Ocean', 'Grace Lewis'),
('A Thousand Beautiful Moments', 'Samuel Walker'),
('The Secret Garden of Hope', 'Mia Hall'),
('Shadows of the Past', 'Joseph Allen');

SELECT * FROM BOOKS

/*Create BOOKS_Authors table with BookID primary key, Foreign key and AuthorName columns*/
CREATE TABLE BookAuthors (
	BookID INT NOT NULL,
	AuthorName varchar(255) NOT NULL
);

/*Populate the Books_Authors table with Ten different Author names and BookID*/
INSERT INTO BookAuthors
(BookID, AuthorName)
VALUES
('1', 'Ava Wright'),
('2', 'Henry King'),
('3', 'Isabella Young'),
('4', 'Richard Prince'),
('5', 'Henry King'),
('6', 'Joseph Allen'),
('7', 'Richard Prince'),
('8', 'Samuel Walkson'),
('9','Henry King'),
('10', 'Ava Wright');

SELECT * FROM BookAuthors

/*Create BOOK_COPIES table with BookID, BranchID and Number_Of_Copies columns*/
CREATE TABLE BookCopies (
	BookID INT NOT NULL,
	BranchID INT NOT NULL,
	Number_Of_Copies INT NOT NULL
);

/*Populate the Books_Copies table with Number_Of_Copies, BookID and BranchID*/
INSERT INTO BookCopies
(BookID, BranchID, Number_Of_Copies)
VALUES
('1', '1', '2'),
('2', '2', '3'),
('4', '3', '2');


SELECT * FROM BookCopies

/*Create BOOK_LOANS table with BookID, BranchID, CardNo, DateOut and DateDue columns*/
CREATE TABLE BookLoans (
	BookID INT NOT NULL,
	BranchID INT NOT NULL,
	CardNo INT NOT NULL,
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);

/*Populate the Books_Loan table with BookID, BranchID, CardNo, DateOut and DateDue*/
	INSERT INTO BookLoans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	('1', '1', '1', '2026/11/05', '2026/11/10'),
	('2', '2', '2', '2026/10/13', '2026/10/ 25'),
	('3', '3', '3', '2026/11/05', '2026/11/10'),
	('4', '4', '4', '2026/09/18', '2026/09/27'),
	('5', '5', '5', '2026/08/22', '2026/08/24'),
	('6', '6', '6', '2026/10/13', '2026/10/ 25'),
	('7', '7', '7', '2026/09/18', '2026/09/27'),
	('8', '8', '8', '2026/11/05', '2026/11/10'),
	('9', '9', '9', '2026/10/19', '2026/11/26'),
	('10', '10', '10', '2026/10/12', '2026/10/17')

SELECT * FROM BookLoans;

/*FULL OUTER JOIN ON BOOK_LOAN, BORROWER AND BOOKS*/
SELECT * FROM ((BookLoans FULL OUTER JOIN Borrower ON BookLoans.CardNo = 
Borrower.CardNo) FULL OUTER JOIN BOOKS ON BookLoans.BookID = BOOKS.BookID)

/*A query that returns all book titles and the authors name*/
SELECT BOOKS.BookTitle, BookAuthors.AuthorName FROM BOOKS INNER JOIN BookAuthors ON BOOKS.BookID = BookAuthors.BookID


SELECT BookTitle, Number_Of_Copies FROM BookCopies, BOOKS WHERE BranchID = 1;

SELECT BOOKS.BookTitle, BookCopies.Number_Of_Copies, Library_Branch.BranchID FROM BookCopies INNER JOIN BOOKS ON BOOKS.BookID = BookCopies.BranchID
INNER JOIN Library_Branch ON BookCopies.BookID = BookCopies.BranchID WHERE BookTitle ='The Lost Tribe' AND BranchName = 'Sharps Town';

SELECT SUM(BookCopies.Number_Of_Copies) AS TotalCopies FROM BookCopies AS BookCopies INNER JOIN BOOKS AS BOOKS
ON BookCopies.BookID = BOOKS.BookID INNER JOIN Library_Branch ON BookCopies.BookID = BookCopies.BranchID WHERE BookTitle ='The Lost Tribe' AND BranchName = 'Sharps Town';


/*b*/
SELECT BookTitle, Number_Of_Copies FROM BOOKS, BookCopies WHERE BranchID = 3; 

SELECT BOOKS.BookTitle FROM BOOKS WHERE BookID = 10;