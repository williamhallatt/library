--A way to drop identity constraints when selecting into 
--temp DB so that identity column can be modified.

SELECT *
INTO #TEMP
FROM <YourTableWithIdentityColumn>

--This drops the identity restraint
UNION ALL

SELECT TOP (1) *
FROM <YourTableWithIdentityColumn>
WHERE 1 = 0

--Can now update 'identity' column
UPDATE #Temp
SET IdentityColumn = IdentityColumn + 100

SELECT *
FROM #Temp

DROP TABLE #Temp