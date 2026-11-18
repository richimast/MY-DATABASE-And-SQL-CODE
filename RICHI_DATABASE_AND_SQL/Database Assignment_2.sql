USE Richi_Movie_DB
GO

CREATE PROCEDURE DataBase_Assignment
AS
BEGIN

CREATE TABLE Actors (
	Actors_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Actor_First_Name VARCHAR(50) NOT NULL,
	Actor_Last_Name VARCHAR(50) NOT NULL,
	Movie_Title VARCHAR(50) NOT NULL
	);

INSERT INTO Actors
	(Actor_First_Name, Actor_Last_Name, Movie_Title)
	VALUES
	('Maxwell', 'Coby', 'The Night With You'),
	('Richard', 'Moon', 'My Love'),
	('Ernest', 'Sky', 'The Dangerous'),
	('Maxwell', 'Chelse', 'The Night With You'),
	('Brown', 'Clark', 'The Prisoner'),
	('Richard', 'Moon', 'Shoot To Kill')
	;
	SELECT * FROM Actors;

CREATE TABLE Directors (
	Director_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Director_First_Name VARCHAR(50) NOT NULL,
	Director_Last_Name VARCHAR(50) NOT NULL,
	Movie_Title VARCHAR(50) NOT NULL,
	Actors_ID INT,
	CONSTRAINT fk_Actors FOREIGN KEY(Actors_ID) REFERENCES Actors(Actors_ID)
	);

	INSERT INTO Directors
		(Director_First_Name, Director_Last_Name, Movie_Title, Actors_ID)
		VALUES
		('Cosby', 'Anthony', 'My Love', 2),
		('Prince', 'Benson', 'To Me', 3),
		('Bright', 'Oman', 'Yes You are Mind', 4),
		('Cosby', 'Anthony', 'Shoot To Kill', 6),
		('Kofi', 'Carlos', 'The Blue Colours', 1),
		('Stephen', 'Mark', 'Perfect Love', 5)
		;
		SELECT * FROM Directors

	/*A statement that retrieve data from Actors and Directors tables*/
	SELECT Actor_First_Name, Actor_Last_Name, Director_First_Name, Director_Last_Name FROM Actors
	INNER JOIN Directors ON Actors.Movie_Title = Directors.Movie_Title;
END