--- fetch records in table at 10 seconds interval postrgres
select distinct t1.*
from payments t1
         join payments t2
              on t2.created_at between (t1.created_at - interval '10 second')
                     and (t1.created_at + interval '10 second')
                  and t2.id != t1.id
order by id