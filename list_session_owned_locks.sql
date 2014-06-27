select a.session_id,
       a.XIDUSN,
       a.XIDSLOT,
       a.XIDSQN,
       b.Object_Name "Object Name",
       b.Object_Type "Type",
       DECODE(a.locked_mode,0,'None',1,'Null',2,'Row-S',
                            3,'Row-X',4,'Share',5,'S/Row-X',
                            6,'Exclusive',a.Locked_Mode) "Locked Mode",
       v.CTIME "Duration",
       d.sql_text "Stmt"
 from v$locked_object a,sys.all_objects b, v$session s, v$lock v, v$sql d
 where a.object_id = b.object_id
   and a.session_id = s.SID
   and v.sid = a.session_id
   and v.ID1 = b.object_id
   and s.sql_address = d.address(+) AND s.sql_hash_value = d.hash_value(+)
 order by 8 desc
