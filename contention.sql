select event, time_waited, round(time_waited*100/sum(time_waited) over(),1) wait_pct
from (select event, time_waited
     from v$system_event
     where event not in 
     ('Null event', 'client message', 'rdbms ipc reply', 'smon timer', 'rdbms ipc message',
      'PX Idle Wait', 'file open', 'pmon timer', 'WMON goes to sleep', 'virtual circuit status',
      'dispatcher timer', 'SQL*Net message from client', 'parallel query dequeue wait', 'pipe get')
     UNION
     (select name, value from v$sysstat
      where name like 'CPU used when call started'))
order by 2 desc;

select name, gets, sleeps, sleeps*100/sum(sleeps) over() sleep_pct, sleeps*100/gets sleep_rate
from v$latch where gets > 0
order by sleeps desc;


