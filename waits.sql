SELECT   event, sum(total_waits), sum(time_waited) tw, sum(average_wait)
FROM v$session_event
group by event
order by tw desc
