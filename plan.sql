select id "ID", 
operation "Operation", 
decode(options, null, ' ', options) "Options", 
decode(object_name, null, ' ', object_name) "Object Name", 
decode(optimizer, null, ' ', optimizer) "Mode", 
decode(cost, null, ' ', cost) "Cost",
decode(bytes, null, ' ', bytes) "Bytes", 
decode(cardinality, null, ' ', cardinality) "Cardinality"
from v$sql_plan
where address = hextoraw('070000001CA00590')
and hash_value = 2288454383
order by id, parent_id
