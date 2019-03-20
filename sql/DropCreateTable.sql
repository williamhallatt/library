--Scaffolding to drop/create table.

IF (
		EXISTS (
			SELECT *
			FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_SCHEMA = 'yourschema'
				AND TABLE_NAME = 'yourtable'
			)
		)
BEGIN
	DROP TABLE [yourschema].[yourtable]
END

BEGIN
	CREATE TABLE [yourschema].[yourtable] (
		column1 VARCHAR(50) NOT NULL
		,column2 INT NOT NULL
		--etc
		)
END