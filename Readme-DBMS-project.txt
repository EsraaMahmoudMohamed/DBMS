Our Project is DBMS Using Menu
                                                                                                            ** ***************************** *******  
 -------------------------------------------------------------||                                                                                                                                                                                                          
Team Member:
1-Nada El Bayomy Ahmed
2-Esraa Mahmoud mohamed Elsyed
--------------------------------------------------------------||

"Description of project":
*************************
   
1)createTable 4)updateRecord 7)displayTable 10)Exit 
2)alterTable  5)deleteRecord  8) truncateTable 
3)insertRecord 6)search     9)dropTable 
#?
                                                                                                          
Create Table :
we take 3 things from user
1- table name 
2-no of columns
3- colname  coltype primary (sperated by space )
then we create two file 
the first one table content all information about each col like ( colname:coltype:primary) called tablemeta
the second table content in first line col name and the other line is the data we will insert it in this table 
------------------------------------------------------------------------------------------------------------------------------------------
Delete Record: 
< delete table where col=val>
we take 3 things from user 
1-table name 
2-colname 
3-col value
when we find this colvalue in this colname in table name we remove this record from the table 
---------------------------------------------------------------------------------------------------------------------------
Select Record: 
< select* from table where col=val>
we take 3 things from user 
1-table name 
2-colname 
3-col value
when we find this colvalue in this colname in table name we display this record from the table 
---------------------------------------------------------------------------------------------------------------------------
Update Record: 
< update table  set col=val where col=val>
we take  5 things from user 
1-table name 
2-colname in set
3-col value in set
4-colname in where
5-col value in where
first we find the line we want to update by colname &colvalue in where condition
then 
we change the line in index of colname in set that we want to update it by replace the old value by new value 
-------------------------------------------------------------------------------------------------------------------------------------------
Insert Record:
<insert table value >
we take table name from user 
and then ask him to add value for each col when we display col name 
if col name is primary we check for value to be uniqe and not null otherwise we cant accepted this value
then we check about datatype for this value if this value not matched with coltype we cant accept it 
-----------------------------------------------------------------------------------------------------
Drop Table :
<drop table >
we take 1 thing from user 
1- table name 
first check if this table exist or not if exist rmove table and metatable for this table 
if doesnt exist echo message table not exist 
-----------------------------------------------------------------------------------------------------------------
Display Table :
<display table -> select * from table  >
we take 1 thing from user 
1- table name 
first check if this table exist or not if exist display all table record   
if doesnt exist echo message table not exist 
-----------------------------------------------------------------------------------------------------------------
Turncate Table :
<truncate table >
we take 1 thing from user 
1- table name 
first check if this table exist or not if exist remove all  table record but dont make chang in meta table  
if doesnt exist echo message table not exist 
-----------------------------------------------------------------------------------------------------------------
Alter Table:
<alter table add col >
<alter table remove col>
 first we take 2 things from user 
1- table name 
then choose between two choice:
1- add col
2-drop col
if choose add col 
you must insert col name 
if col already exist echo message that col is already exist 
if not exist take from user 2 things 
1- column type ( int/ string )
2- column is primary or not 
if choose drop col 
take col name from user 
if this col is primary echo message that this col cant  be remove
if not primary remove it from table data and table meta 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
Special Notes:
1)a new line is needed after table creation it is not done
2)AlterTable.sh file is separated
3)the working directory for table creation is ~/DBMS/$tablename but other functions is depending on the current working directory
4)tempfiles is not deleted after usage they are temporarily needed
5)Alter is for adding a new column or dropping an existing column
                                                                                                                  
