/* Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
 */

-- přidání sloupce s cenou za předchozí rok
-- přídání sloupce s rozdílem cen oproti předchozímu roku
-- vytvoření view

CREATE VIEW v_payroll_difference_over_time AS
SELECT
	payroll_per_year,
	payroll_year,
	lag(payroll_per_year) OVER (ORDER BY payroll_year) AS payroll_previous_year,
	payroll_per_year - lag(payroll_per_year) OVER (ORDER BY payroll_year) AS payroll_difference
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf
GROUP BY payroll_year;

-- výpočet percentuálních změn mezd v čase
-- vytvoření view

CREATE VIEW v_payroll_percent_increase_per_year AS
SELECT 
	*,
	round(((payroll_previous_year-payroll_per_year) / payroll_previous_year)*100,1) AS payroll_percent_increase
FROM v_payroll_difference_over_time AS pdot;

-- výpočet sumy cen za jednotlivé roky
-- přidání sloupce s cenou za předchozí rok
-- přídání sloupce s rozdílem cen oproti předchozímu roku
-- vytvoření view

CREATE VIEW v_price_difference_over_time AS
SELECT
	sum(avg_price) AS sum_of_avg_price,
	price_year,
	LAG(sum(avg_price)) OVER (
						PARTITION BY price_category_name ORDER BY price_year) AS avg_price_previous_year,
	sum(avg_price) - lag(sum(avg_price)) OVER (
						PARTITION BY price_category_name ORDER BY price_year) AS avg_price_difference
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf
GROUP BY price_year;

-- výpočet percentuálních změn cen potravin v čase
-- vytvoření view

CREATE VIEW v_price_percent_increase_per_year AS
SELECT 
	*,
	round(((avg_price_previous_year-sum_of_avg_price)/avg_price_previous_year)*100,1) AS price_percent_increase
FROM v_price_difference_over_time AS pdot
GROUP BY price_year;

-- výpočet rozdílu meziročního nárůstu cen potravin a mezd
-- join obou views

SELECT
	price_year AS YEAR,
	sum_of_avg_price,
	payroll_per_year,
	price_percent_increase,
	payroll_percent_increase,
	price_percent_increase-payroll_percent_increase AS percent_increase_difference,
	CASE
		WHEN price_percent_increase-payroll_percent_increase < -10 THEN 'significant increase'
		WHEN price_percent_increase-payroll_percent_increase < 0 THEN 'increase'
		ELSE 'decrease'
	END AS status	
FROM 
	v_price_percent_increase_per_year AS ppipy 
	JOIN v_payroll_percent_increase_per_year AS ppipy2
		ON ppipy2.payroll_year = ppipy.price_year ;