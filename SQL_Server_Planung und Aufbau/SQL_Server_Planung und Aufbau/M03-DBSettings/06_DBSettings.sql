/*

DB bestehen aus :

.mdf
.ldf

Anfangsgröße von DBs

16MB
mdf  8 MB
ldf  8 MB


Wachstumsrate	 + 64 MB


Alex Fall: SQL 2014

mdf 5 MB + 1 MB
ldf 2 MB +10 % 


------------5mb

--in der Praxis sind gute Anfangswerte :
--Größe am Ende der Lebenszeit

--Das Logfiles sollte ca 25 - 30% der DAtendateeien

--Backups werden sehr kleine bleiben, da keine Leerstellen gesichert werden

--






*/



use master
GO

create database testdb



create table test (id int identity, spx char(4100))


insert into test 
select 'XY' 
GO 20000




