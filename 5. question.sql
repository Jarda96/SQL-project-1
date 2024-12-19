/*
*Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?
*/

-- přidání sloupce s HDP za předchozí rok
-- přídání sloupce s rozdílem HDP oproti předchozímu roku
-- vytvoření view 

CREATE VIEW v_GDP_difference_over_time AS
SELECT
	avg(GDP) AS avg_GDP,
	GDP_year,
	LAG(avg(GDP)) OVER (ORDER BY GDP_year) AS avg_GDP_previous_year,
	avg(GDP) - lag(avg(GDP)) OVER (ORDER BY GDP_year) AS avg_GDP_difference
FROM t_jaroslav_cermak_project_sql_secondary_final AS tjcpssf
GROUP BY price_year;



-- napojení ročních percentuálních změn HDP na tabulku s výpočtem percentuálních změn cen potravin a výšky mezd
-- pomocí podmínek zodpovězení otázky


WITH cte_gdp_per_year AS (
				SELECT 
					gdp_year,
					avg_gdp,
					round(((avg_GDP_previous_year-avg_GDP)/avg_GDP_previous_year)*100,1) AS GDP_percent_increase
				FROM v_GDP_difference_over_time AS pdot
				GROUP BY GDP_year
				)
SELECT
	price_year AS YEAR,
	sum_of_avg_price AS avg_price_per_year,
	payroll_per_year,
	avg_gdp,
	price_percent_increase,
	payroll_percent_increase,
	gdp_percent_increase,
	CASE
		WHEN gdp_percent_increase < -3 THEN "Significant GDP increase"
		WHEN gdp_percent_increase < 0 THEN "Normal GDP increase"
		ELSE "GDP decrease"
	END AS gdp_increase_status,
	CASE
		WHEN payroll_percent_increase < -3 THEN "Significant payroll increase"
		WHEN payroll_percent_increase < 0 THEN "Payroll increase"
		ELSE "Payroll decrease"
	END AS payroll_change_status,
	CASE
		WHEN price_percent_increase < -3 THEN "Significant price increase"
		WHEN price_percent_increase < 0 THEN "Price increase"
		ELSE "Price decrease"
	END AS price_change_status
FROM 
	v_price_percent_increase_per_year AS ppipy 
	JOIN v_payroll_percent_increase_per_year AS ppipy2
		ON ppipy2.payroll_year = ppipy.price_year		
	JOIN cte_gdp_per_year AS gpy
		ON gpy.gdp_year = ppipy2.payroll_year
GROUP BY price_year;