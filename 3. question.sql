/* Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
 */

-- přidání sloupce s cenou za předchozí rok
-- přídání sloupce s rozdílem cen oproti předchozímu roku
-- vytvoření view

CREATE VIEW v_price_difference_per_category_over_time AS 
SELECT
	avg_price,
	price_category_name,
	price_value,
	price_unit,
	price_year,
	LAG(avg_price) OVER (
						PARTITION BY price_category_name ORDER BY price_year) AS avg_price_previous_year,
	avg_price - lag(avg_price) OVER (
						PARTITION BY price_category_name ORDER BY price_year) AS avg_price_difference
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf
GROUP BY price_category_name, price_year;

-- výpočet percentuálních změn cen potravin v čase

WITH cte_avg_percent_increase AS (
		SELECT 
			*,
			round(((avg_price_previous_year-avg_price)/avg_price_previous_year)*100) AS percent_increase
		FROM v_price_difference_per_category_over_time AS pdpcot
		)
SELECT 
	price_category_name,
	price_value,
	price_unit,
	round(avg(percent_increase),1) AS avg_percent_increase_per_category_name,
	CASE
		WHEN round(avg(percent_increase),1) > 0 THEN 'price decrease'
		WHEN round(avg(percent_increase),1) < 0 THEN 'price increase'
	END trend
FROM cte_avg_percent_increase
GROUP BY price_category_name
ORDER BY avg_percent_increase_per_category_name desc;