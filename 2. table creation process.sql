-- vytvoření 2. tabulky pro zodpovězení 5. otázky


/*
 * 1. HDP - vytvoření view	
 */

CREATE VIEW v_czechia_gdp as
SELECT 
	country,
	YEAR AS gdp_year,
	GDP
FROM economies AS e
WHERE country = 'Czech Republic' AND GDP IS NOT NULL;

/*
 * 2. finální vytvoření tabulky propojením 1. tabulky s view o HDP pro Českou republiku
*/

CREATE TABLE t_jaroslav_cermak_project_SQL_secondary_final as
SELECT 
	payroll_per_year,
	payroll_year,
	avg_price,
	price_year,
	country,
	gdp_year,
	GDP
FROM
	t_jaroslav_cermak_project_SQL_primary_final AS tjcpspf
	JOIN v_czechia_gdp AS cg
		ON tjcpspf.payroll_year = cg.gdp_year;

	
	