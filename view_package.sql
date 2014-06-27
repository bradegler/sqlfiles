var package_name varchar2(30);
var line_number varchar2(30);
var window varchar2(30);

begin
    :package_name := '&PACKAGE_NAME';
    :line_number := '&LINE_NUMBER';
    :window := '&WINDOW';
end;
/

select '[' || line || ']: ' || text 
from user_source 
where name = UPPER(:package_name)
and type = 'PACKAGE BODY' 
and line between :line_number - :window and :line_number + :window;
