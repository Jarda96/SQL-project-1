/* Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
 * 
 */


SELECT
	avg_price,
	price_category_name ,
	price_value ,
	price_unit ,
	price_year 
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf
WHERE price_category_name = 'Kapr živý'
GROUP BY price_year ;

-- přidání ceny za předchozí rok
-- přídání rozdílu cen oproti předchozímu roku
-- vytvoření view

CREATE VIEW price_difference_over_time AS 
SELECT
	avg_price,
	price_category_name ,
	price_value ,
	price_unit ,
	price_year,
	LAG(avg_price) OVER (
						PARTITION BY price_category_name ORDER BY price_year) AS avg_price_previous_year,
	avg_price - lag(avg_price) OVER (
						PARTITION BY price_category_name ORDER BY price_year) AS avg_price_difference
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf
GROUP BY price_category_name, price_year;


-- percentuální růst cen v čase
SELECT 
	*,
	round(((avg_price_previous_year-avg_price)/avg_price_previous_year)*100) AS percent_increase
FROM price_difference_over_time AS pdot ;