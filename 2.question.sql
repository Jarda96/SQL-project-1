/* Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
*/

-- Výpočet množství koupeného mléka za rok 2006

SELECT 
	round(AVG(payroll_per_year)/avg_price) AS number_of_bought_milk_per_year,
	avg_price,
	price_category_name,
	price_value, 
	price_unit,
	price_year
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf
WHERE price_category_name = 'Mléko polotučné pasterované'
	AND price_year = 2006;

-- Výpočet množství koupeného chleba za rok 2006

SELECT 
	round(AVG(payroll_per_year)/avg_price) AS number_of_bought_bread_per_year,
	avg_price,
	price_category_name,
	price_value,
	price_unit,
	price_year
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf
WHERE price_category_name = 'Chléb konzumní kmínový'
	AND price_year = 2006;

-- Výpočet množství koupeného mléka za rok 2018

SELECT 
	round(AVG(payroll_per_year)/avg_price) AS number_of_bought_milk_per_year,
	avg_price,
	price_category_name,
	price_value,
	price_unit,
	price_year
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf
WHERE price_category_name = 'Mléko polotučné pasterované'
	AND price_year = 2018;

-- Výpočet množství koupeného chleba za rok 2018

SELECT 
	round(AVG(payroll_per_year)/avg_price) AS number_of_bought_bread_per_year,
	avg_price,
	price_category_name,
	price_value,
	price_unit,
	price_year
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf
WHERE price_category_name = 'Chléb konzumní kmínový'
	AND price_year = 2018;