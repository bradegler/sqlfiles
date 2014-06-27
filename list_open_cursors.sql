select * from 
(
  select SQL_Text "SQL", max(user_name), count(*) 
  from v$open_cursor 
  group by SQL_Text
  order by 3 desc
)
where rownum < 200