variable v_ret1 REFCURSOR;
/
declare
 v_num1 NUMBER;
 v_txt VARCHAR2(4000);
-- v_ret1 TREXONE.REFERENCE_CURSOR_TYPE;
 begin
	dbms_output.put_line('Starting Execution...');	
    --erx_mule.csr_extract('PA', :v_ret1);
    trexone.populate_rx_intake_order(10095692520, :v_ret1);
	dbms_output.put_line('Execution Succeeded...');	
 end;
/
print v_ret1;
/
