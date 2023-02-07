 USE [master]
GO
CREATE LOGIN [Max] WITH PASSWORD=N'123', 
DEFAULT_DATABASE=[Northwind], 
CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO


USE [Northwind]
GO
CREATE USER [Max] FOR LOGIN [Max]
GO


USE [master]
GO
CREATE LOGIN [Evi] WITH PASSWORD=N'123', DEFAULT_DATABASE=[Northwind], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [Northwind]
GO
CREATE USER [Evi] FOR LOGIN [Evi]
GO




--GRUPPE = ROLLE


--DML U D I
--DDL CR DROP ALTER

--Serverrolle.. f�r Adminzwecke	  fix definierte Rolle
--               seit 2012 auch benutzderf Serverrollen

--Datenbankrollen	   --DB_rollen d�rfen Rechte auf lle Tabelle 
--der DB anwenden


--Ordner = Schema

--Ziel: Schemastrukuren f�r Rechte

--MAX = IT 
--Evi = MA
--dbo = "DB Besitzer.." darf in der DB alles

USE [Northwind]
GO
CREATE SCHEMA [IT] AUTHORIZATION [dbo]
GO

USE [Northwind]
GO
CREATE SCHEMA [MA] AUTHORIZATION [dbo]
GO

--DemoTabellen

create table it.personal(itperso int)
create table it.projekte (itprojekte int)

create table ma.personal(maperso int)
create table ma.projekte (maprojekte int)


--Evi soll alle MA Tabellen lesen d�rfen
use [Northwind]
GO
GRANT SELECT ON SCHEMA::[MA] TO [Evi]
GO
--ebenso MAX f�r IT
		  use [Northwind]
GO
GRANT SELECT ON SCHEMA::[IT] TO [Max]
GO

--Evi soll Tabelle anlegen d�rfen
use [Northwind]
GO
GRANT CREATE TABLE TO [Evi]
GO
use [Northwind]
GO
GRANT ALTER ON SCHEMA::[MA] TO [Evi]
GO


 --Evi soll alle Projekttabelle lesen d�rfen

--Vererbte Rechete werden nicht angezeigt
---> Tipp: Effektive anzeigen lassen

use [Northwind]
GO
GRANT SELECT ON [IT].[projekte] TO [Evi]
GO


select * from projekte	--Ebene 16 ??

select * from orders	 --geht

select * from test		--ebene 16



use master


select * from northwind..orders

use northwind
select * from orders

--jeder User hat ein Standardschema
--Standard = dbo


USE [Northwind]
GO
ALTER USER [Max] WITH DEFAULT_SCHEMA=[IT]
GO

USE [Northwind]
GO
ALTER USER [Evi] WITH DEFAULT_SCHEMA=[MA]
GO


--Besser mit Rollen arbeiten
USE [Northwind]
GO
CREATE ROLE [ITROLLE] AUTHORIZATION [dbo]
GO
USE [Northwind]
GO
ALTER ROLE [ITROLLE] ADD MEMBER [Max]
GO


--MAX soll nur �ber Rolle ZUgriff haben
use [Northwind]
GO
REVOKE SELECT ON SCHEMA::[IT] TO [Max] AS [dbo]
GO
use [Northwind]
GO
GRANT SELECT ON SCHEMA::[IT] TO [ITROLLE]
GO



--Tim = neuer IT Mitarbeiter.. 
--soll das gleich tun d�rfen was Max kann

--alles �ber das Login
USE [master]
GO
CREATE LOGIN [Tim] WITH PASSWORD=N'123', DEFAULT_DATABASE=[Northwind], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [Northwind]
GO
CREATE USER [Tim] FOR LOGIN [Tim]
GO
USE [Northwind]
GO
ALTER USER [Tim] WITH DEFAULT_SCHEMA=[IT]
GO
USE [Northwind]
GO
ALTER ROLE [ITROLLE] ADD MEMBER [Tim]
GO


  ---Jeder Sysadmin ist in der DB der dbo


  --Fall Sugardaddy

  use [Northwind]
GO
DENY SELECT ON [dbo].[Employees] TO [Evi]
GO


use [Northwind]
GO
GRANT CREATE VIEW TO [Evi]
GO



USE [Northwind]
GO
CREATE APPLICATION ROLE [Gehaltsrolle] 
WITH DEFAULT_SCHEMA = [dbo], PASSWORD = N'ppedv2021!'
GO


use master

use northwind

exec sp_setapprole 'Gehaltsrolle', 'ppedv2021!'

--�hnlich wie Ausf�hren als



