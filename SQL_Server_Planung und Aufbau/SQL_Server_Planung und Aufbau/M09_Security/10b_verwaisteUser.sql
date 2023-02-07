/*
bei Windows Konten kein Problem, da hier Windows SID verwendet werden

aber bei SQL Konten

Idee 1
Lege ein Login an... bisher no!

Benutzerzuordnung legt User an--doof.. ist schon da-- > no!

Idee 2:
..wenn man alles nach "Konzept" gemacht hätte
--> Rechtevergabe per Rollen und Schema

--User entfernen und Login  mit Benutzerzuordnung neu anlegen
--das würde klappen
Nachteil: neues Kennwort


Idee 3:
hat MS nichts dafür vorgesehen??
nicht wirklich...

*/
use whoamiDB
Go
sp_change_users_login 'Report' ---verwaiste User

sp_change_users_login 'Auto_fix','JamesBond', NULL, 'ppedv2021!' 
---verwaiste User bekommt Login mit gleicher SID

sp_change_users_login 'Update_one', 'JamesBond', 'JamesBond'
--bei bestehenden Logins-- User bekommt SID des Logins

---Hammer!!  sp_change_users_login wird abgeschafft

--Was dann?
--google: sp_help_revlogin










*/

select * from syslogins