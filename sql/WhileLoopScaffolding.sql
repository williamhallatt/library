--Basic while loop setup.

CREATE TABLE #Demo (RowID INT IDENTITY(1, 1))

--Insert data into table.

DECLARE @NumberRecords INT = @@ROWCOUNT
DECLARE @RowCount INT = 1

WHILE @RowCount <= @NumberRecords
BEGIN
	--Do your business here, e.g.
	DECLARE @sql VARCHAR(MAX) = (
			SELECT 'Some demo stuff'
			FROM #Demo
			WHERE RowID = @RowCount
			);

	PRINT @sql

	SET @RowCount = @RowCount + 1
END

DROP TABLE #Demo