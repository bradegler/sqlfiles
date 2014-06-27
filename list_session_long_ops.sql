SELECT s.sid "session",
       e.spid "pid",
       b.opname "Type",
       a.SQL_Text "SQL Text",
       b.start_time "Start Time",
       b.sofar||'/'||b.totalwork "Completed/Total",
       b.elapsed_seconds||'/'||(b.elapsed_seconds+b.time_remaining) "Completed/Total Time",
       b.username "Parsing Schema",
       a.Parse_Calls "Parse Calls",
       a.Executions "Executions",
       a.Sorts "Sorts",
       a.Disk_Reads "Disk Reads",
       a.Buffer_Gets "Buffer Gets",
       a.Rows_Processed "Rows",
       DECODE(a.Executions,0,'N/A',ROUND(a.Sorts/a.Executions,3)) "Sorts/Exec",
       DECODE(a.Executions,0,'N/A',ROUND(a.Disk_Reads/a.Executions,3)) "Disk/Exec",
       DECODE(a.Executions,0,'N/A',ROUND(a.Buffer_Gets/a.Executions,3)) "Buffers/Exec",
       DECODE(a.Executions,0,'N/A',ROUND(a.Rows_Processed/a.Executions,3)) "Rows/Exec",
       DECODE(a.Rows_Processed,0,'N/A',ROUND(a.Sorts/a.Rows_Processed,3)) "Sorts/Rows",
       DECODE(a.Rows_Processed,0,'N/A',ROUND(a.Disk_Reads/a.Rows_Processed,3)) "Disk/Rows",
       DECODE(a.Rows_Processed,0,'N/A',ROUND(a.Buffer_Gets/a.Rows_Processed,3)) "Buffers/Rows",
       b.SQL_Address||':'||b.SQL_Hash_Value " "
  from v$sqlarea a,
       v$session_longops b,
       v$session s,
       v$process e
 where s.sid = b.sid
   and s.SERIAL# = b.SERIAL#
   and s.paddr = e.addr(+)
   and b.sql_address = a.address(+)
   and b.sql_hash_value = a.hash_value(+)
   and b.opname is not null
   and b.start_time > trunc(sysdate)