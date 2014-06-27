SELECT b.sql_text FROM v$session a,
v$sqlarea b 
WHERE  (a.prev_sql_addr = b.ADDRESS OR a.sql_address = b.ADDRESS)  
 AND sid IN (SELECT a.sid
--a.value, b.name 
FROM v$sesstat a, v$statname b 
WHERE a.statistic# = b.statistic# 
AND a.statistic#= 3 
AND a.value > 200)
