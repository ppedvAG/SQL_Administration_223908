/*
ad hoc Abfrage

select * from ...



Views / Sichten

select * from Sicht

gemerkte Abfrage, genauso schnell wie die Adhoc Abfrage
Grund f�r Sichten :
Komplexe Abfragen vereinfachen
Security Sichten k�nnen eig Rechte haben



Prozeduren
k�nnen alles m�gliche enthalten
wie ein Batch
ist schneller  , weil der Plan kompiliert wird 
und auch nach Neustart zur Verf�gung steht

exec procname par1, par2



Funktionen

--sind meist  Gift 
--sind total praktisch
select f(spalte)  from f(wert) where f(spalte) > f(wert)

select * from tabelle where f(spalte) =10


Proz--> Sicht/adhoc--> f()
---------------------------> langsamer




*/

 create view vdemo1
 as
 select * from orders where freight < 10

 select * from vdemo1



 create or alter  procedure prDemo1 @par1 int
 as
 select * from orders where freight > @par1

 exec prDemo1 10