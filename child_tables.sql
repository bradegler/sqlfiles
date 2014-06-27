SELECT LEVEL,
	   LPAD(' ',(LEVEL-1)*4,' ')||PT AS "TNAME"
FROM
(SELECT A.OWNER W1, 
		A.table_name PT, 
		A.constraint_name C1, 
		A.r_constraint_name R1, 
		B.OWNER W2,
		B.table_name CT, 
		B.constraint_name C2, 
		B.r_constraint_name R2
	FROM ALL_CONSTRAINTS A, all_constraints B
	WHERE (A.constraint_name = b.r_constraint_name(+))
	AND A.OWNER = upper('TREXONE_DATA') AND B.OWNER(+) = upper('TREXONE_DATA') 
	AND A.r_constraint_name IS NULL and A.constraint_type in ('P','R')
) V1
START WITH PT = upper('WF_SNOOZE')
CONNECT BY PRIOR CT = PT
/
