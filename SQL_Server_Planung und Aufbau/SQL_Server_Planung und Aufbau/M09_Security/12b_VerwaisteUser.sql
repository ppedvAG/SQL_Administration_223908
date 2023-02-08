Bestandsanalyse von jamesBond

--in DB whoami

STDSchema DBO
kein Schema in Besitz
Mitglied Personalabteilung
Sicherungfähig


Grundsätzlich wurden Rechte per Rollen vergeben


--Wege um das Problem

/*
A)
neues Login JamesBond mit Kennwort
--> andere SID

das Usermapping scheitert weil ein JB schon in der DB enthalten ist


B)
neues Login JB (mit neuer SID)  dann dem JB in der DB gleiche ID verpassen..
?


C)
den JB in der DB löschen, dann
neues Login mit Usermapping und MItglied in Rolle Personal

USE [whoamiDB]
GO
DROP USER [JamesBond]
GO
USE [master]
GO
CREATE LOGIN [JamesBond] WITH PASSWORD=N'123', 
DEFAULT_DATABASE=[whoamiDB], 
CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [whoamiDB]
GO
CREATE USER [JamesBond] FOR LOGIN [JamesBond]
ALTER USER [JamesBond] WITH DEFAULT_SCHEMA=[dbo]
ALTER ROLE [Personalabteilung] ADD MEMBER [JamesBond]
GO

--auf jeden Fall neues Kennwort



Lösung:

sp_change_userslogin

sp_help_revlogin --muss man bei MS besorgen
da zu braucht man den Originalserver




*/


sp_help_revlogin --im Ergebnisfenster tauchen SQL Scripte zum Anlegen der Logins auf inkl Kennwort und SID
	--geht nur 

automatisieren
C:\Users\Administrator>sqlcmd -S. -E -dmaster -Q"sp_help_revlogin" > c:\logins.sql

--dbatools.io  -- PS Script


use whoamiDB
sp_change_users_login 'Report' --verwaiste User

--ein passendes Login anlegen
sp_change_users_login 'Auto_fix' , 'jamesbond',NULL ,'ppedv2019!'

--Wenn ein gleichnamiges Login besteht aber andere SID besitzt
----------------------                 User        Login
sp_change_users_login 'Update_one', 'JamesBond', 'JamesBond'




select * from sysusers --0xA6EAD14673E2DA49A6D6C8A522A06681