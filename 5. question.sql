/*
*Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?
*/


SELECT 
	*
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf ;

SELECT 
	*
FROM countries AS c
WHERE country = 'Czech republic';

SELECT 
	*
FROM economies AS e
WHERE country = 'czech republic';