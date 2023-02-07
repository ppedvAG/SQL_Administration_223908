-- Wiederherstellungsmodel

/*

Einfach
das T sichert alle INS UP DEL Bulk (rudment‰r) weg ins Protokoll. Ist eine Statemtn zuEnde, 
wird die die Anweisung aus dem Log geˆscht
Das Log ist nicht sicherbar	und daher kein Restore per Tlog
  --bei TestDb  sich kaum ver‰ndernde Daten



Massenprotokolliert
wie Einfach auch Bulk nur rudiment‰r
es wird aus dem Tlog nichts gelˆscht
 --daher muss man das Tlog sichern! 
 --aber wenn ein Bulk vorkam, dann kein Restore auf Sek mˆglich
 --sonst schon


Vollst‰ndig
es wird alles gesichert, was sich irgendwie bewegt und auch sehr exakt
auch Bulk exakt
--> Restore auf Sek
--> w‰chst schneller und braucht mehr Ressourcen
--Anwendung: bei ProduktivDbs



Man kann zw den Modellen jederzeit wechseln
--bei Massenimpoerten in der Nacht 
--Das Log wurde zu groﬂ
--danach immer Vollsicherung
