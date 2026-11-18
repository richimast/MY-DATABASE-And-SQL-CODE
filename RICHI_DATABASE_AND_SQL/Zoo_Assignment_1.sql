USE [db_zooTest1]
GO
/****** Object:  StoredProcedure [dbo].[getANIMAl_information]    Script Date: 14/10/2026 16:59:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 ALTER PROC [dbo].[getANIMAl_information]
 @animalName varchar(50)
 AS
 BEGIN
	DECLARE @errorString VARCHAR(100)
	DECLARE @results VARCHAR(5)

	SET @errorString = 'There are no ' + @animalName + '''s found at this zoo.'

	BEGIN TRY
		SET @results = (SELECT COUNT(tb1_species.species_name) FROM tb1_species WHERE species_name = @animalName)
		IF @results = 0
			BEGIN
				RAISERROR(@errorString, 16, 1)
				RETURN
			END
		ELSE IF @results = 1
			BEGIN
				SELECT
				a1.species_name, a2.animalia_type, a3.class_type, a4.order_type,
				a5.habitat_type, a6.nutrition_type, a7.care_type
				FROM tb1_species a1
				INNER JOIN tb1_animalia a2 ON a2.animalia_id = a1.species_animalia
				INNER JOIN tb1_class a3 ON a3.class_id = a1.species_class
				INNER JOIN tb1_order a4 ON a4.order_id = a1.species_order
				INNER JOIN tb1_habitat a5 ON a5.habitat_id = a1.species_habitat
				INNER JOIN tb1_nutrition a6 ON a6.nutrition_id = a1.species_nutrition
				INNER JOIN tb1_care a7 ON a7.care_id = a1.species_care
				WHERE species_name =  @animalName
				;
			END
	END TRY

	BEGIN CATCH
		SELECT @errorString = ERROR_MESSAGE()
		RAISERROR (@errorString, 10, 1)
	END CATCH
END

/*Composed statement that returns all data in the habitat table.*/
SELECT * FROM tb1_habitat;

/*Composed statement that Retrieve all names from the species_name column of the tbl_species table that have a species_order value of 3.*/
SELECT species_name FROM tb1_species WHERE species_order = 3;

/*Composed statement that Retrieve only the types from the column nutrition_type of the tbl_nutrition table 
that have a nutrition_cost of 600.00 or less.*/
SELECT nutrition_type FROM tb1_nutrition WHERE nutrition_cost <= 600;

/*Composed statement that Retrieve all species_names from tbl_nutrition that have a nutrition_id between 2202 and 2206.*/
SELECT species_name FROM tb1_nutrition
INNER JOIN tb1_species ON tb1_species.species_nutrition = tb1_nutrition.nutrition_id
WHERE nutrition_id BETWEEN 2202 AND 2206;

/*Composed statement that Retrieve all names from the species_name column in the tbl_species table and their corresponding nutrition_type from the tbl_nutrition table 
While the data is returned using these aliases: "Species Name: " for the species_name column and "Nutrition Type: " for the nutrition_type column.*/
SELECT tb1_species.species_name AS 'Species Name',
	tb1_nutrition.nutrition_type AS 'Nutrition Type'
FROM tb1_species
INNER JOIN tb1_nutrition ON tb1_nutrition.nutrition_id = tb1_species.species_nutrition;

/*Composed statement From the specialist table, that retrieve the first name, last name and contact number for the people that provide care to penguins. 
INNER JOINs will be used to connect these three tables needed: tbl_specialist, tbl_species, and tbl_care.*/
SELECT specialist_fname AS 'First Name',
	   specialist_lname AS 'Last Name',
	   specialist_contact AS 'Contact'
	   FROM tb1_specialist
	   INNER JOIN tb1_care ON tb1_care.care_specialist = tb1_specialist.specialist_id
	   INNER JOIN tb1_species ON tb1_species.species_care = tb1_care.care_id
	   WHERE species_name = 'penguin';