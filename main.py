from sqlalchemy import create_engine, engine
import pandas as pd

engine = create_engine(
    'postgresql+psycopg2://root:root@localhost/test_db')

sql = '''
select * from vw_authors
'''

df = pd.read_sql_query(sql, engine)

sql_harari = '''
select * 
from public."NYT" as t1
where t1.author='Yuval Noah Harari'
'''

df_harari = pd.read_sql_query(sql_harari , engine)

sql_query = '''
with cte_nyt as(
select distinct 
		t1.author
		,t1.title
		,t1.published_date 
from public."NYT" as t1
order by 
		t1.author
		,t1.title 
)
select *
	, row_number () over (order by author, title) as "row_number"
	, row_number () over (partition by author order by author, title) as "row_number_author_title"
	, row_number () over (partition by author order by published_date ) as "row_number_date_author"
	, row_number () over (partition by title order by published_date ) as "row_number_date_title"
	, first_value (title) over (partition by author order by author, title) as "first_song"
	, lag(title, 1) over (partition by author order by author, title) as "last_song_from_author"
	, lead (title,1) over (partition by author order by author, title) as "next_song_from_author"
from cte_nyt

'''

df_insights = pd.read_sql_query(sql_query , engine)