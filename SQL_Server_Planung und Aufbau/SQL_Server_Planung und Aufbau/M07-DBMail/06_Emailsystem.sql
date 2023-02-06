
--SQL Server ist ein Mail Client.. braucht einen SMTP Server
--
--Windows Server bringen einen SMTP Server mit ;-)
--eigenen SMTP Server: Server Manager 
	--Feature SMTP Server hinzufügen

-- IM IIS 6.0 Manager eine neue Maildomäne anlegen
--   sql.local..neue Alias Domäne
--Eigenschaften des SMTP Server: 
--	Zugriff: relay: 127.0.0.1 gestatten 


--SQL Server muss noch wissen, wie er Emails verschicken soll...

--DatenbankEmail aktivieren... 
--Profil einrichten (Tipp: einfachen Namen vergeben ohne mathm oder Leerzeichen)

--SMTP Konto angeben... Systemparameter zb auf 10MB anpassen..

--Öfftl oder privates Profil definieren
--Öfftl: --> msdb: Mitglied der Rolle DatabaseMailuserRole
--Privat: man bekommt ein direkt erteiltes Recht das Profil verwenden zu dürfen


--Damit Agent Emails versendet:
-- Agent Eigeschaften --> Warnungsystem aktivieren & Mailprofilangeben
-- Agent neu starten



exec msdb..sp_Send_dbmail @query='select * from orders' ,@recipients



