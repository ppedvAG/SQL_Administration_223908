/* 


Richtlinien

best Practice

SQL Logins sollte nicht sein...!

Dienste automatisch gestartet! --Agent

Trenne Log von Daten per eig HDDs

Backup weg von HDD der DB

Backup die letzten 24 Stunden

bei Produktivservern so exakt qwie möglich --> RecoveryModel : Full

guest sollte inaktiv sein..--jeder der ein Login kann rein, wenn ein Gast aktiv ist

Facets: Eigenschaften (prüfbar)

Bedingungen ......an Eigenschaften



 Eine Reihe von Policies gibts von Microsoft
 ..allerdings nicht mehr auf DVD

 allerdings auf Github

 https://github.com/MicrosoftDocs/sql-docs/blob/live/docs/relational-databases/policy-based-management/monitor-and-enforce-best-practices-by-using-policy-based-management.md


*/
Declare @condition_id int
EXEC msdb.dbo.sp_syspolicy_add_condition @name=N'DB_mustHave', @description=N'', @facet=N'Database', @expression=N'<Operator>
  <TypeClass>Bool</TypeClass>
  <OpType>EQ</OpType>
  <Count>2</Count>
  <Attribute>
    <TypeClass>Numeric</TypeClass>
    <Name>RecoveryModel</Name>
  </Attribute>
  <Function>
    <TypeClass>Numeric</TypeClass>
    <FunctionType>Enum</FunctionType>
    <ReturnType>Numeric</ReturnType>
    <Count>2</Count>
    <Constant>
      <TypeClass>String</TypeClass>
      <ObjType>System.String</ObjType>
      <Value>Microsoft.SqlServer.Management.Smo.RecoveryModel</Value>
    </Constant>
    <Constant>
      <TypeClass>String</TypeClass>
      <ObjType>System.String</ObjType>
      <Value>Full</Value>
    </Constant>
  </Function>
</Operator>', @is_name_condition=0, @obj_name=N'', @condition_id=@condition_id OUTPUT
Select @condition_id

GO



--Anwendung der Bedingung = Richtlinie


Declare @object_set_id int
EXEC msdb.dbo.sp_syspolicy_add_object_set @object_set_name=N'policy_ObjectSet', @facet=N'Database', @object_set_id=@object_set_id OUTPUT
Select @object_set_id

Declare @target_set_id int
EXEC msdb.dbo.sp_syspolicy_add_target_set @object_set_name=N'policy_ObjectSet', @type_skeleton=N'Server/Database', @type=N'DATABASE', @enabled=True, @target_set_id=@target_set_id OUTPUT
Select @target_set_id

EXEC msdb.dbo.sp_syspolicy_add_target_set_level @target_set_id=@target_set_id, @type_skeleton=N'Server/Database', @level_name=N'Database', @condition_name=N'', @target_set_level_id=0


GO

Declare @policy_id int
EXEC msdb.dbo.sp_syspolicy_add_policy @name=N'Pol_DB_Produktion', @condition_name=N'DB_mustHave', @execution_mode=0, @policy_id=@policy_id OUTPUT, @object_set=N'policy_ObjectSet'
Select @policy_id


GO







*/