--Scaffolding to drop/create sproc.

IF EXISTS (
		SELECT *
		FROM sys.procedures
		WHERE NAME = 'yoursprocname'
			AND SCHEMA_NAME(schema_id) = 'yourschemaname'
		)
BEGIN
	DROP PROCEDURE [yourschemaname].[yoursprocname]
END
GO

CREATE PROCEDURE [yourschemaname].[yoursprocname] (
	@yourinputvariable INT
	--etc
	)
AS
BEGIN

-- Do Stuff

END