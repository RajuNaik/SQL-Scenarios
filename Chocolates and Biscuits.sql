create table brands 
(
category varchar(20),
brand_name varchar(20)
);
insert into brands values
('chocolates','5-star')
,(null,'dairy milk')
,(null,'perk')
,(null,'eclair')
,('Biscuits','britannia')
,(null,'good day')
,(null,'boost');


select * from brands;

with cte1 as(
select *,ROW_NUMBER() over(order by (select null)) as rn from brands
),cte2 as(
select *,lead(rn,1,999999999999999) over(order by (select null))as nxt_rn from cte1 where category is not null
)
select cte2.category as category,cte1.brand_name as brand_name from cte1 as cte1 join cte2 as cte2
on cte1.rn>=cte2.rn and cte1.rn<=cte2.nxt_rn-1