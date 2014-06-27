SELECT TO_CHAR(s.startup_time,' DD MON "at" HH:MI:SS') INSTART_FMT,
di.instance_name INST_NAME, di.dbid, di.db_name DB_NAME, s.snap_id SNAP_ID,
TO_CHAR(s.end_interval_time,'DD MON YYYY HH:MI') SNAPDAT, s.snap_level LVL
FROM dba_hist_snapshot s, dba_hist_database_instance di
WHERE di.dbid = s.dbid
AND di.instance_number = s.instance_number
AND di.startup_time = s.startup_time
ORDER BY snap_id;


SELECT output 
FROM TABLE(dbms_workload_repository.awr_report_text (
3186199890, -- DB ID
1, -- RAC Node
34961, -- Begin Snapshot
34963 -- End Snapshot
));


select output from table(dbms_workload_repository.awr_report_text(3186199890,1,35277,35278))
