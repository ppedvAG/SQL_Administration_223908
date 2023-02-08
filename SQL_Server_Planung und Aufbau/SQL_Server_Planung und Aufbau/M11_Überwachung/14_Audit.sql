--�berwachung ..Audits

--1) LogFile anlegen ...am besten kategorisch

--2) �berwachung auf Server oder und  auf DB m�glich

--auf DB auch pro Objekt und User m�glich

--jede �berwachung muss aktiviert werden. 

--tipp: nur Zeitweise aufzeichnen und bei gro�en Mengen aun Ereignissen evtl filtern

--Bereich Sicherheit-- �berwachsungsspezifikation

--> Logfile zum Aufzeichnen best Ereignisse


--> Sicherheit--> Server�berwachung
	--> Ereignisse des Server in das Logfile aufzeichnen
	--> Ereigbnisse im Sinne: alles was auf dem Server passieren kann (Login etc)
		--> keine Ereignisse innerhlab einer DB (Select zb)

--> Sicherheit im Bereich der DB
	--> Datenbank�berwachungsspezifikation
	--> Hier lassen sie gezielt Ereignisse innerhlab der DB aufzeichen 
--		und sehr gut filtern. zB Alle SELECT des Otto auf Tabelle Employees
--		auch unspezifischer m�glich: Alle Select innerhalb eines Schemas f�r Rollen


-- Tipp: nicht permanent protkollieren. Kann sehr viel werden.. Aktivieren/Deaktivieren

--Auswerten evtl per TSQL etwas einfacher

SELECT * FROM sys.fn_get_audit_file
('d:\_Backup\SecurtiyAudit_C1C5449D-C110-4CF9-876A-CE8566A6BB13_0_133156566495530000.sqlaudit',default,default)
where database_principal_name = 'Evi'
GO  
