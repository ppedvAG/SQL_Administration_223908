/*

master

das "Herz"
Logins
Datenbanken
Konfiguration des SQL Servers

BACKUP: ja !
 --------------------------
model
Vorlage für neue DB
Änderungen nur höchst selten, aber hätten einen Auswirkung auf alle DBs 
die danach erstellt werden

BACKUP:  ja

--------------------------

tempdb
#tab ##tab temporär
Zeilenversion
Auslagerungen
IX Wartung 

BACKUP: no!

---------------------------
msdb

DB für den Agent (Jobs , Emailsystem, Wartungs, ..)

BACKUP: ja!
----------------------------

distribution

--nur dann vorhanden , wenn Replikation
--BACKUP : ja


-- regel Sicherung --> Wartungsplan