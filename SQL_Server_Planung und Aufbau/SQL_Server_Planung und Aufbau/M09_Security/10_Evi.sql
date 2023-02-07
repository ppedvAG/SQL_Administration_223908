--Evi

select * from customers

select * from ma.personal

select * from ma.projekte

select * from it.projekte


--Evi soll Tabellen anlegen dürfen

create table ma.test (matest int)

--Soll IT Projekte lesen

select * from it.projekte

select * from projekte


select * from dbo.employees


create view ma.vProjekte
as
select * from it.projekte
UNION ALL
select * from ma.projekte


alter view ma.vProjekte
as
select * from dbo.employees

--MA Evi darf lesen
--dbo Employees Lesen verweigert

select * from vprojekte

--Was sollte man demnach nie tun!
-->Gib nie einem normal sterblichen User das Recht
--Create View / Procedure /function
select * from ma.projekte


---Ev