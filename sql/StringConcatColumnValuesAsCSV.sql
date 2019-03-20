-- Concatenate the names of all the columns in a table as CSV

SELECT LEFT(ColumnName, LEN(ColumnName)-1)
FROM(
    SELECT ColumnName + ', '
    FROM <YourDatabaseTable>
    FOR XML PATH('')
) DB (ColumnName)

--OR

DECLARE @listStr VARCHAR(MAX)
SELECT @listStr = COALESCE(@listStr+',' ,'') + ColumnName
FROM <YourDatabaseTable>
SELECT @listStr