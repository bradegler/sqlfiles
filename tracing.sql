-- Turns on tracing
alter session set events '10046 trace name context forever, level 8';
-- Makes trace file easier to find
alter session set tracefile_identifier=begler;
-- Finds the SPID for the session
SELECT p.spid FROM v$mystat m, v$session s, v$process p
WHERE m.statistic# = 1 AND s.SID = m.SID
AND p.addr = s.paddr;
-- Turns off tracing
alter session set events '10046 trace name context forever, level 0';
