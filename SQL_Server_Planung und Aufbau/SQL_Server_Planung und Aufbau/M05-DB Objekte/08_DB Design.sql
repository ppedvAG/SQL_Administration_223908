--Prim�rschl�ssel PK
--Fremdschl�ssel  FK	 
--Normalisierung


--PK 1:N  FK  ref. Integrit�t	--kein Stammdatensatz kann gel�scht werden , solange 
--Fremdschl�sselwerte existieren

--kein Kunde kann ge�scht werden, solange noch sein ID in Bestellungen auftaucht




delete from customers where customerid = 'ALFKI'
select * from orders where customerid = 'ALFKI'


   delete from customers where customerid = 'FISSA'
select * from orders where customerid = 'FISSA'


--Wenn PK da sind, warum sind keine ref Integrit�ten vorhanden??

--Wieso nehmt ihr so einen bl�den Datentyp?
--Ein unn�tzer Mehraufawand bei Datentypen spiegelt sich 1:1 im Arbeitsspeicher wieder


vorname: Otto

varchar(50)-- 'Otto' 4 
char(50)  -----	 'Otto                   '  50
nvarchar(50)  -- N = Unicode  'Otto' 4*2  = 8
nchar(50)	'Otto    ' 50 *2 = 100
text() -- gar �nicht mehr nehmen .. ist seit 2005 auf der Abschussliste

��?wq�zy


Datum
datetime	 (ms)
datetime2	 (ns)
smalldatetime (sek)
datetimeoffset	(+ Zeitzone in ms)
date / time		(Datum und Zeit)


decimal (10,2) -- 10 Zeichen L�nge davon 2 Nachkommastellen
float --viele Nachkommastellen
money -- 8 Nachkommastellen

int +- 2,1 Mrd
smallint 32000
tinyint + 255



  --viele Datentyoen ind Verschwendung 
select country, customerid from customers

select * from orders