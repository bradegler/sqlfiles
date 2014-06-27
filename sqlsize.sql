select address, hash_value, sum(vsize(sql_text)) bytes
from v$sqltext
group by address, hash_value
order by bytes desc
