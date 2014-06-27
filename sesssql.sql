select sql_text from v$session vs, v$sqltext vt
where vt.address = vs.sql_address
and vt.hash_value = vs.sql_hash_value
and vs.sid = 22
order by piece

