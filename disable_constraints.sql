spool s.sql

select 'ALTER TABLE ' || table_name || ' disable CONSTRAINT ' || constraint_name || ';'
from user_constraints;

spool off

@s
