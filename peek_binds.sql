 SELECT sql_id,
       child_number,
       executions
  FROM v$sql
WHERE sql_id = :sql_id;

SELECT *
  FROM TABLE (DBMS_XPLAN.display_cursor (sql_id            => :sql_id,
                                         cursor_child_no   => :child_number,
                                         format            => '+PEEKED_BINDS +NOTE'));
