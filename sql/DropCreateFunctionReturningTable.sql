--Scaffolding to drop/create a function that returns a table.

IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE [object_id] = OBJECT_ID(N'[yourschemaname].[yourfunctionname]')
			AND type IN (
				N'FN'
				,N'IF'
				,N'TF'
				,N'FS'
				,N'FT'
				)
		)
	DROP FUNCTION [yourschemaname].[yourfunctionname]
GO

CREATE FUNCTION [yourschemaname].[yourfunctionname] ()
RETURNS TABLE
AS
RETURN (
		WITH cte AS (
				-- do your magic
				)
		SELECT *
		FROM cte
		);