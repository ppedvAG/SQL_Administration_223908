/*

master

das "Herz"
Logins
Datenbanken
Konfiguration des SQL Servers

BACKUP: ja !
 --------------------------
model
Vorlage f�r neue DB
�nderungen nur h�chst selten, aber h�tten einen Auswirkung auf alle DBs 
die danach erstellt werden

BACKUP:  ja

--------------------------

tempdb
#tab ##tab tempor�r
Zeilenversion
Auslagerungen
IX Wartung 

BACKUP: no!

---------------------------
msdb

DB f�r den Agent (Jobs , Emailsystem, Wartungs, ..)

BACKUP: ja!
----------------------------

distribution

--nur dann vorhanden , wenn Replikation
--BACKUP : ja


-- regel Sicherung --> Wartungsplan