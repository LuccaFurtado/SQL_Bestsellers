
with cte_author as (
select 
	t1.author
	,count(*) as qtd_author
FROM PUBLIC."NYT" as t1
group by t1.author
order by qtd_author 

),
cte_title as(
select 
	t1.title 
	,count(*) as qtd_title
FROM PUBLIC."NYT" as t1
group by t1.title 
order by qtd_title
)

select distinct  
	t1.author
	,t2.qtd_author
	,t1.title
	,t3.qtd_title
FROM PUBLIC."NYT" as t1 
left join cte_author as t2 on (t1.author = t2.author)
left join cte_title as t3 on (t1.title = t3.title)
order by t3.qtd_title desc

