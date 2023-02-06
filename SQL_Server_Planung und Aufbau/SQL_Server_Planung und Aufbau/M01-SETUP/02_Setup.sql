   /* Setup

   Sicherheit
   NT Authentifizierung immer vorhanden

   SQL Authentifzierung  , wenn NT nicht möglich

   ist beides aktiv, dann nennt sich gemischte Authentifizierung"

	NT ist besser!	  kann man jederezeit ändern

	im falle von gemischt--> Konto SA --> sehr komplexes Kennwort
	besser das KOnto spter deaktivieren und Ersatzkonto anlegen saadmin

	Windows Admins sind keine SQL Admins
	Person oder Gruppen  (Pflicht)


	Dienste und Dienstkonten   nur diese führen tats Dinge aus
	SQL Server	(Datebankmodul)
	SQL Agent (Jobs, Zeitpläne))
	SQL Browser	  Rezeptionist für Instanzen  (UDP 1434)
	Volltextsuche

	Konten: NT Service\MSSQLSERVER		  #
	...NT Service = verw Dienstkonto

	+ vorteil: Kennwörter sind komplex und werden autom geändert

	-nachteil: komplexer in der Praxis
	sind reine lokale Konten    im Netz mit Computerkonto
	auch DomUser als Doenstkonten sind möglich


	Pfade

	DB besteht aus :
	.mdf master data file (Daten , Systemtabellen)
	-ldf Transaktionsprotokoll

	 --Trenne Daten von Logfiles physikalisch
	Pfad für Benutzerdatenbankdateien
	Pfad für Benutzerdatenbankprotokolldateien



	tempdb
	eig Laufwerke, evtl sogar Daten und Logfile getrennte Laufwerke


	Instanzen und Freigegebene Funktionen

	SQL Server kann:
	DB Modul
	SSAS SQL Server Analysis Service Datawarehouse
	SSIS SQL Server Integration Services  Datenpumpe
	SSRS Reporting Services sind nicht mehr Bestandteil des SQL Server


	Intanzen sind mehrfach installierbare Services
	 ist komplett autark und isoliert von anderen Instanzen


	SQL DB Modul und SSAS

	benannten Instanzen haben einen random Port (Browser Dienst)

	Grund für Instanzen...
	Security
	Performance	, weil manche Servereinstellungen 
	nicht optimal sind für best DBs

	Software ist nicht mit besth Instanz kompatibel


	---Es gibt nach dem Setup kein Tool zum Administrieren
	SSMS muss man seperat herunterladen (18.12.1)
	SSMS 19 Preview 3 (für SQL 2022)




	 16GB RAM und 4 Kerne  1 HDD

	--Virtualisierung

	--HyperV-- OS und HyperV muss man 4 GB abziehen
	
				RAM							Kerne
	--HV-DC	   2048 (1024 - 2048)			  2
	-HV-SQL1   6000 fix                       4
	-HV-SQL2   4000 fix                       4




































   */