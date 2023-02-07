 /*

 Vollständige Backup V
 Inkrementelles Backup Transaktionsprotokollsicherung T
 Differenz Sicherung	   D


 V	    6:00
	T
	T
	T
	T
		D
	T
	T
	T
	T
		D	15:00
	T	 neuer Kunde
	T
	T	 eine Best für neuen Kunden
	T	 17:45

 V ist einen komplette Sicherung  zu einem Zeitpunkt
   Pfade, Dateinamen und Größe
   kann komprimieren
   Checkpoint
 D merkt sich die Änderungen seit dem letzten V	 zu einem Zeitpunkt
	Checkpoint
 T Sicherung aller Anweisungen seit der letzten Sicherung (V oder D oder T)
	Checkpoint
	man kann auf Sek restoren
	leert das Transaktionsprotokoll


  Was ist der schnellste Restore?
  V

  Wie lange dauert der Restore eines T in etwa?
  solange wie Anweisung im Orig dauerten
  wird ein T alle 30min gesichert, dann kann der restore auch max 30min dauern

  !! Daher sollte man immer zwischen den Ts ein D eintreuen
  --> sicherer und Restore  wird schneller



 Bsp:

 Zelle 100		 7:00
 +10
 +20
 +390
 -239		   stop at 7:03:10	   nur mit T möglich
 -30
 -30
 +39
 -36
 +38		  7.05
 ....
 Zelle 100


 V TTTxTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTDTTTTT


 Was kann alles passieren?


 1. DB defekt (fehlerverdächtig) --am Ende kaputt

 2. Nur ein Teil (mdf oder ldf ) defekt

 3. Serverausfall Hdds sind noch vorhanden)

 4. Fälschlicher Weise Daten manipulert

 5. Migration oder kompletter Servertot

 6. Wenn ich weiss, dass jetzt gleich was passieren kann (Update einspielen)


 --Am besten mit gerinsgt mögichen Datenverlust restoren



   Fall 4: Daten falsch

   zB Alle Kunden wohnen in Mainz

   DB ist ok!


   11:30 letzte Sicherung
   11:32  Problem


   11:50 Meldung Error

   Idee:  DB unter anderen Namen restoren von 11:30
			klappt nur, wenn wir genau wissen pwas passiert ist.
Beim Restore aufpassen: unter anderen Namen heisst auch andere Dateien!
+ Fragementischerung deaktiveren



Fall 5: Restore eines Backups auf anderen Server

Ideal: wenn das Backup dort liegt, wo der andere Server es auch erwarten würden

Aufpassen: Pfade	 , nie von neu auf alt

 Fall 2: Server teilweise tot bzw eine HDD ist defekt

 Wir haben : DB Dateien und Backup
 Dateien sind brandaktuell

 DB Offline: Dateien können kopiert werden

 Dateien lassen sich kopieren ,wenn der SQL Server nicht mehr zugreift (offline oder getrennt)
 Auf anderen Servefr Anfügen (mind mdf). Ein fehlendes Log kan man erstellen lassen



  Fall 4: mit geringst möglichen Datenverlist und DB muss restored werden


  11:00 letzte Sicherung T
  11:28 Problem gemeldet
  11:32 jetzt!!

  12:00 nächste T Sicherung

  toDO:
Idee 1: 
Restore des letzten V D T .. Verlust mind 32 min

Idee 2:
Warten bis 12 Uhr, dann restore von 11:27.l aber Verlust:33 min

Idee 3:
;-)
 wir machen jetzt eine T Sicherung, restore von 11:27
 Allerdings dauert das Backup des T von 11:32 ca 5 min

 --Verlust: mind 10 min, weil die doofen DAU weiterarbeiten


 Idee 4:
 ;-) ;-)

User runterkicken
Sicherung von 11:32 dauert 5 min
Restore von 11:27

USE [master]
ALTER DATABASE [Northwind] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
BACKUP LOG [Northwind] TO  DISK = N'D:\_BACKUP\Northwind_LogBackup_2022-12-14_11-39-42.bak' WITH NOFORMAT, NOINIT,  NAME = N'Northwind_LogBackup_2022-12-14_11-39-42', NOSKIP, NOREWIND, NOUNLOAD,  NORECOVERY ,  STATS = 5
RESTORE DATABASE [Northwind] FROM  DISK = N'D:\_BACKUP\nwindtz.bak' WITH  FILE = 1,  NORECOVERY,  NOUNLOAD,  REPLACE,  STATS = 5
RESTORE DATABASE [Northwind] FROM  DISK = N'D:\_BACKUP\nwindtz.bak' WITH  FILE = 9,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [Northwind] FROM  DISK = N'D:\_BACKUP\nwindtz.bak' WITH  FILE = 10,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [Northwind] FROM  DISK = N'D:\_BACKUP\nwindtz.bak' WITH  FILE = 11,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [Northwind] FROM  DISK = N'D:\_BACKUP\nwindtz.bak' WITH  FILE = 12,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [Northwind] FROM  DISK = N'D:\_BACKUP\Northwind_LogBackup_2022-12-14_11-39-42.bak' WITH  NOUNLOAD,  STATS = 5,  STOPAT = N'2022-12-14T10:30:11'
ALTER DATABASE [Northwind] SET MULTI_USER

GO




 Fall 6: Wenn ich weiss..

 --Snapshot

 --Kann man einen Snapshot sichern?
 --nö

 --Kann man einen Snapshot restoren?
 --hä? nö!!

 --Kann man die OrgDB nch backupen?
 --Jo!!

 --Kann man die OrgiDB normal restoren?
 --nö!			.. erst wenn alle Snpshot gelöscht wurden

 --man kann mehrere Snapshots machen

















 */


 ---Wie groß ist eurer DB?	1000GB

 --Welche Arbetiszeiten habt ihr?

 --Mo bis Fr
 --von 6:00 bis 20 Uhr

 --Wie lange darf die DB ausfallen?
 --10min			--Hochverfügbarkeit (Spiegelung AVG Cluster)


 --Wieviel Datenverlust in Zeit darf mn haben?
 --15min


 --Wie würdet ihr die Sicherung planen?

 --V: täglich 21 Uhr (ausser sa und so)
 --T:  = DAtenverlust alle 15 min  von 6:15 bis 20:15   ausser SA und so
 --D:  alle 30min  oder auch 60min  von 6:40 bis  19:40 ausser sa und so



 V TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTxTTTTTTTTTTTTTTTTTTTTDTTTTTT

 --!! Verwende nie eine!! Datei für alle Sicherungen

 --Ideal: Wartrungplan

 /*
 Ausfallzeit: 15min
 Datenverlust: 0 --> Hochverfügbarkeit (AVG, Spiegelung)
 DAtenverlust: 	10min

 DB Größe: 50GB

 MO - FR 6 bis 20 Uhr

 V:	 täglich Mo bis Fr 22 Uhr
 T:  10min Mo bis Fr von 6:10 bis 20:10
 D:  alle 30min	 Mo bis Fr von 6:35  bis 20:06


 T 90Sek
 V 300





 */

