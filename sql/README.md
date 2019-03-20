# MSSQL

* [CursorScaffolding.sql](CursorScaffolding.sql) - basic cursor setup
* [DropCreateFunctionReturningTable.sql](DropCreateFunctionReturningTable.sql) - scaffolding to drop/create a function that returns a table
* [DropCreateTable.sql](DropCreateTable.sql) - scaffolding to drop/create table
* [SelectIntoTempDropIdentity.sql](SelectIntoTempDropIdentity.sql) - a way to drop identity constraints when selecting into temp DB so that
  identity column can be modified
  * [SelectProcViewTriggerObjectDefinitions.sql](SelectProcViewTriggerObjectDefinitions.sql) - selects all sprocs, view and trigger object
    definitions in a DB
  * [sp_helptable.sql](sp_helptable.sql) - generate table definition
  * [SprocScaffolding.sql](SprocScaffolding.sql) - scaffolding to drop/create sproc
  * [StringConcatColumnValuesAsCSV.sql](StringConcatColumnValuesAsCSV.sql) - concatenates names of all columns in table as CSV
  * [WhileLoopScaffolding.sql](WhileLoopScaffolding.sql) - basic while loop setup
