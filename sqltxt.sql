select sql_text from v$sqltext
where address = hextoraw('070000001CA00590')
and hash_value = 2288454383
order by piece
