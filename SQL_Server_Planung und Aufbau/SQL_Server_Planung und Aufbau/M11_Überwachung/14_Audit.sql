--Überwachung ..Audits

--1) LogFile anlegen ...am besten kategorisch

--2) Überwachung auf Server oder und  auf DB möglich

--auf DB auch pro Objekt und User möglich

--jede Überwachung muss aktiviert werden. 

--tipp: nur Zeitweise aufzeichnen und bei großen Mengen aun Ereignissen evtl filtern

--Bereich Sicherheit-- Überwachsungsspezifikation

--> Logfile zum Aufzeichnen best Ereignisse


--> Sicherheit--> Serverüberwachung
	--> Ereignisse des Server in das Logfile aufzeichnen
	--> Ereigbnisse im Sinne: alles was auf dem Server passieren kann (Login etc)
		--> keine Ereignisse innerhlab einer DB (Select zb)

--> Sicherheit im Bereich der DB
	--> Datenbanküberwachungsspezifikation
	--> Hier lassen sie gezielt Ereignisse innerhlab der DB aufzeichen 
--		und sehr gut filtern. zB Alle SELECT des Otto auf Tabelle Employees
--		auch unspezifischer möglich: Alle Select innerhalb eines Schemas für Rollen


-- Tipp: nicht permanent protkollieren. Kann sehr viel werden.. Aktivieren/Deaktivieren

--Auswerten evtl per TSQL etwas einfacher

SELECT * FROM sys.fn_get_audit_file
('d:\_Backup\SecurtiyAudit_C1C5449D-C110-4CF9-876A-CE8566A6BB13_0_133156566495530000.sqlaudit',default,default)
where database_principal_name = 'Evi'
GO  
