select b.sid,b.schemaname,b.osuser,b.program,
       bb.sid,bb.schemaname,bb.osuser,bb.program,
       decode(a.type,
              'MR', 'Media Recovery',
              'RT', 'Redo Thread',
              'UN', 'User Name',
              'TX', 'Transaction',
              'TM', 'DML',
              'UL', 'PL/SQL User Lock',
              'DX', 'Distributed Xaction',
              'CF', 'Control File',
              'IS', 'Instance State',
              'FS', 'File Set',
              'IR', 'Instance Recovery',
              'ST', 'Disk Space Transaction',
              'TS', 'Temp Segment',
              'IV', 'Library Cache Invalidation',
              'LS', 'Log Start or Switch',
              'RW', 'Row Wait',
              'SQ', 'Sequence Number',
              'TE', 'Extend Table',
              'TT', 'Temp Table',
              'Internal ('||a.type||')'),
       DECODE(a.lmode,0,'None',1,'Null',2,'Row-S',3,'Row-X',4,'Share',5,'S/Row-X',6,'Exclusive',TO_CHAR(a.lmode)),
       DECODE(a.request,0,'None',1,'Null',2,'Row-S',3,'Row-X',4,'Share',5,'S/Row-X',6,'Exclusive',TO_CHAR(a.request)),
       d.object_name,
       ' ',
       TO_CHAR(SYSDATE-a.CTIME/3600/24)
  from v$lock a,v$session b,v$locked_object c,sys.all_objects d, v$lock aa, v$session bb, v$locked_object cc
 where a.sid = b.sid
   and c.session_id = a.sid
   and d.object_id = c.object_id
   and aa.sid != a.sid
   and aa.id1 = a.id1
   and aa.id2 = a.id2
   and aa.sid = cc.session_id
   and cc.object_id = c.object_id
   and bb.sid = aa.sid
   and a.request != 0