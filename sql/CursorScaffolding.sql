--Basic cursor setup

--Need a variable for each field to select.
DECLARE @VarExample1 VARCHAR(50)
	,@VarExample2 VARCHAR(50);

DECLARE keyCursor CURSOR
FOR
SELECT ColumnOne
	,ColumnTwo
FROM #<YourTableName>

OPEN keyCursor

FETCH NEXT
FROM keyCursor
INTO @VarExample2
	,@VarExample1

WHILE @@FETCH_STATUS = 0
BEGIN

--Execute logic here.

FETCH NEXT
	FROM keyCursor
	INTO @VarExample2
		,@VarExample1
END

CLOSE keyCursor;

DEALLOCATE keyCursor;