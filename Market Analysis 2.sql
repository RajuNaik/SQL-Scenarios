create table users1 (
user_id         int     ,
 join_date       date    ,
 favorite_brand  varchar(50));

 create table orders (
 order_id       int     ,
 order_date     date    ,
 item_id        int     ,
 buyer_id       int     ,
 seller_id      int 
 );

 create table items
 (
 item_id        int     ,
 item_brand     varchar(50)
 );


 insert into users1 values (1,'2019-01-01','Lenovo'),(2,'2019-02-09','Samsung'),(3,'2019-01-19','LG'),(4,'2019-05-21','HP');

 insert into items values (1,'Samsung'),(2,'Lenovo'),(3,'LG'),(4,'HP');

 insert into orders values (1,'2019-08-01',4,1,2),(2,'2019-08-02',2,1,3),(3,'2019-08-03',3,2,3),(4,'2019-08-04',1,4,2)
 ,(5,'2019-08-04',1,3,4),(6,'2019-08-05',2,2,4);

 select * from orders;
 select * from users1;
 select * from items;

with cte1 as(
 select o.* ,i.item_brand,rank() over(partition by o.seller_id order by o.order_date desc) rnk,u.favorite_brand,
 case when i.item_brand=u.favorite_brand then 'yes' else 'no' end as fav_flag
 from orders o,items i,users1 u where o.item_id=i.item_id and o.seller_id=u.user_id
)
select cte1.seller_id,cte1.fav_flag as second_item_fav_brand from cte1 cte1 where cte1.rnk=1


