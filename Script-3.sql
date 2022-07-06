create view vw_authors as (
with cte_artists as(
select t1.published_date
		,t1."rank"
		,t1.title 
		,t1.author
		,row_number () over (partition by author order by author, published_date) as "author_position"
from public."NYT" as t1
order by author, published_date 
)
select t1.published_date
		,t1.title 
		,t1."rank"
		,t1.author
from cte_artists as t1
where t1."author_position" = 1 
);

select * 
from vw_authors as v1
where v1.author like 'Daniel%'
or v1.author in (
			'George R R Martin'
			,'George RR Martin'	
)

