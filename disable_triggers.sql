spool temp.sql

select 'alter trigger ' || trigger_name || ' disable;' from user_triggers;

spool off

@temp
