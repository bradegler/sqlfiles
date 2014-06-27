create type my_row_type as object (
	val1 number(18);
	val2 varchar2(100);
);

create function f_get_vals return my_row_type pipelined
as
begin
	for cur in (select 1 val1, 'test' val2 from dual)
	loop
		pipe_row(my_row_type(cur.val1, cur.val2));
	end loop;
	return;
end f_get_vals;
