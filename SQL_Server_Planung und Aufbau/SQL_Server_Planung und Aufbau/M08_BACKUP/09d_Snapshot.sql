   --Momentaufnahme

 
USE master
GO


-- Create the database snapshot
CREATE DATABASE SN_Nwind_1200 --Name der SNapshotDB
ON
( NAME = Northwind,	 --logischer Name der Datendatei
 FILENAME =  'D:\_SQLDBDATA\SN_Nwind_1200.mdf'
 )
AS SNAPSHOT OF northwind		 -- Name der Orig DB
GO



 select * from customers	  --



 --Es darf keiner auf den beiden DBs sein

 restore database northwind
 from database_Snapshot = 	'sn_nwind_1200'


 --alle müssen runter

 --DMVs
 select db_id('northwind') --5
  select db_id('sn_nwind_1200') --11

 select * from sys.sysprocesses
 where spid > 50
		and dbid in (5,11) 

kill 55
kill 88


 --restore von Snapshot

