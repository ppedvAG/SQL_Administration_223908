--Stellvertretekonto 

--Ausführen als.. nur für dem Agent, damit dieser 
--best Jobs wie PS / CMD ausführen 

 -- es geht immer um nicht SQL Ressourcen
 --

 USE [master]
GO
CREATE CREDENTIAL [KarioAdmin] WITH IDENTITY = N'KAIRO\Administrator', SECRET = N'ppedvAG01!'
GO

USE [msdb]
GO
EXEC msdb.dbo.sp_add_proxy @proxy_name=N'ProxyKairoAdmin',@credential_name=N'KarioAdmin', 
		@enabled=1, 
		@description=N'Kairo Admin darf nur PS und CMD'
GO
EXEC msdb.dbo.sp_grant_proxy_to_subsystem @proxy_name=N'ProxyKairoAdmin', @subsystem_id=3
GO
EXEC msdb.dbo.sp_grant_proxy_to_subsystem @proxy_name=N'ProxyKairoAdmin', @subsystem_id=12
GO



--jetzt ist das KOnto fürentsprechende Schritte im Agentjob
--wählbar..