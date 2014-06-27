SELECT a.SQL_Text "SQL Text",
       a.Executions "Executions",
       a.Sorts "Sorts",
       a.cpu_time "CPU Time",
       a.elapsed_time "Elapsed Time",
       (select max(pl.cost) from v$sql_plan pl
	where pl.address = a.address
	and pl.hash_value = a.hash_value
	and pl.id = 0) "Cost",
       DECODE(a.Executions,0,0,ROUND(a.Sorts/a.Executions,0)) "Sorts/Exec",
       a.Disk_Reads "Disk Reads",
       DECODE(a.Executions,0,0,ROUND(a.Disk_Reads/a.Executions,0)) "Disk/Exec",
       a.Buffer_Gets "Buffer Gets",
       DECODE(a.Executions,0,0,ROUND(a.Buffer_Gets/a.Executions,0)) "Buffers/Exec",
       a.Rows_Processed "Rows",
       DECODE(a.Executions,0,0,ROUND(a.Rows_Processed/a.Executions,0)) "Rows/Exec",
       DECODE(a.Rows_Processed,0,0,ROUND(a.Sorts/a.Rows_Processed,0)) "Sorts/Rows",
       DECODE(a.Rows_Processed,0,0,ROUND(a.Disk_Reads/a.Rows_Processed,0)) "Disk/Rows",
       DECODE(a.Rows_Processed,0,0,ROUND(a.Buffer_Gets/a.Rows_Processed,0)) "Buffers/Rows",
       a.First_Load_Time "First Load Time",
       b.username "Parsing Schema",
       a.Parse_Calls "Parse Calls",
       a.Address,
       a.Hash_Value
  from v$sqlarea a,
       sys.all_users b
 where a.parsing_user_id = b.user_id
   and b.username = 'TREXONE_DATA' 
order by "Buffers/Exec" desc;

