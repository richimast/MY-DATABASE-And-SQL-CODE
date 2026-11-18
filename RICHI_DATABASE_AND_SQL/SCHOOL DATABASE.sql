USE School_DB
GO

CREATE PROCEDURE Get_School_Info
AS
BEGIN
/*Create Classes table with Class_ID primary key and Class_Name columns*/
CREATE TABLE Classes (
	Class_ID INT NOT NULL PRIMARY KEY,
	Class_Name Varchar(255) NOT NULL
);

/*Create Students table with Student_ID primary key and Stuednt_Name colums*/
CREATE Table Students(
	Student_ID INT NOT NULL PRIMARY KEY,
	Student_Name varchar(255) NOT NUll
);

/*Create Instructors table with Instructor_ID primary key and Instructor_Name columns*/
CREATE TABLE Instructors (
	Instructor_ID INT NOT NULL PRIMARY KEY,
	Instructor_Name Varchar(255) NOT NULL
);

/*Add foreign keys Class_ID and Instructor_ID to Students table*/
/*First add the columns and allow NULL values*/
ALTER TABLE Students ADD Class_ID INT NULL;
ALTER TABLE Students ADD Instructor_ID INT NULL;
/*Alter table to add FK constraints*/
ALTER TABLE Students ADD CONSTRAINT fk_Class_ID FOREIGN KEY (Class_ID) REFERENCES Classes(Class_ID);
ALTER TABLE Students ADD CONSTRAINT fk_Instructor_ID FOREIGN KEY (Instructor_ID) REFERENCES Instructors(Instructor_ID);

/*Populate the Classes table with two classes*/
INSERT INTO Classes 
VALUES
(1, 'Software Developer Boot Camp'),
(2, 'C# Boot Camp');

SELECT * FROM Classes

/*Populate the Student table with six students*/
INSERT INTO Students
(Student_ID, Student_Name)
VALUES
(1, 'Mary'),
(2, 'Grace'),
(3, 'Richardson'),
(4, 'Eric'),
(5, 'Matthew'),
(6, 'Varonica');

SELECT * FROM Students

/*Populate the Instructors table with two Instructors*/
INSERT INTO Instructors 
VALUES
(1, 'Richard'),
(2, 'Mercy');

SELECT * FROM Instructors

/*Assign Class_ID column within the Students table*/
UPDATE Students
SET Class_ID = 1 WHERE Student_ID <= 3;
UPDATE Students
SET Class_ID = 2 WHERE Student_ID > 3;

/*Assgn Instructor_ID column within the Students table*/
UPDATE Students
SET Instructor_ID = 2 WHERE Class_ID = 1;
UPDATE Students
SET Instructor_ID = 1 WHERE Class_ID = 2;

/*A query to display all instructor names*/
SELECT Instructor_Name FROM Instructors;

/*A query to display all student names in alphabetical order*/
SELECT Student_Name FROM Students
ORDER BY Student_Name ASC;

/*A query that displays all classes with students and instructors assigned to each*/
SELECT Classes.Class_Name, Students.Student_Name, Instructors.Instructor_Name
FROM ((Classes INNER JOIN Students ON Classes.Class_ID = Students.Class_ID)
INNER JOIN Instructors ON Students.Instructor_ID = Instructors.Instructor_ID);
END