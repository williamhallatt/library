--Selects all sprocs, view and trigger object definitions in a DB

SELECT object_definition(object_id)
FROM sys.objects
WHERE type_desc IN (
		'SQL_SCALAR_FUNCTION'
		,'SQL_STORED_PROCEDURE'
		,'SQL_TABLE_VALUED_FUNCTION'
		,'SQL_TRIGGER'
		,'VIEW'
		)