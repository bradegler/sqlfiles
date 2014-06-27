set lines 132 pages 0

spool temp.sql

select 'select '''||table_name||''', count(*) row_count from ' || table_name || ';' from user_tables;

spool off

@temp
