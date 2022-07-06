--CREATE TABLE--
create table public."NYT"(
"published_date" date NULL,
"list_name" varchar(300) NULL,
"list_name_encoded" varchar(300) NULL,
"rank" int4 NULL,
"isbn13" varchar(300) NULL,
"isbn10" varchar(300) NULL,
"title" varchar(300) NULL,
"author" varchar(300) NULL,
"description" varchar(1000) NULL,
"amazon_product_url" varchar(600) NULL,
"price" float8 NULL,
"weeks_on_list" int4 NULL
);
 

SELECT t1.title
	,t1.published_date
	,t1."rank"
	,t1.author
	,t1.price
FROM PUBLIC."NYT" AS t1 limit 100;

SELECT t1.title
	,t1.author
	,count(*) AS qtd_titulos
FROM PUBLIC."NYT" AS t1
--WHERE t1.author = 'Stephen King'
GROUP BY t1.author
	,t1.title
ORDER BY qtd_titulos desc
limit 100;


SELECT t1.title
	,t1.author
	,count(*) AS qtd_titulos
FROM PUBLIC."NYT" AS t1
WHERE t1.author IN (
		'Stephen King'
		,'Yuval Noah Harari'
		)
GROUP BY t1.author
	,t1.title
ORDER BY qtd_titulos DESC;
