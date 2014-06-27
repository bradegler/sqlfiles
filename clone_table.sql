declare
	v_table varchar2(32) := 'TEST';
	v_clone varchar2(32) := 'X' || v_table;
begin
	execute immediate 'drop synonym ' || v_table || ';';

	execute immediate 
		'create table ' || v_clone || ' as select * from trexone_data.' || v_table || ';';
	
	execute immediate
		'create view ' || v_table || ' as select * from ' || v_clone || 
		' where (erx_client_id = ''ERX'' or erx_client_id like ( sys_context(''ERX_CONTEXT'', ''ERX_CLIENT_ID'') || ''%'')); ';

end;
