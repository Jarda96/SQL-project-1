-- vytvoření 1. tabulky

/*
 * 1. mzdy - vytvoření view
 * 		připojení názvu odvětví k tabulce se mzdami (czechia_payroll_industry_branch)
 * 		odstranění nul (důvěrných informací)
 * 		odebrání průměrného počtu zaměstnanců
 *  	odebrání počtu osob
 * 		odebrání přepočtených změstnaců
 */

CREATE VIEW czechia_payroll_per_industry_branch AS
SELECT 
	sum(value) AS payroll_per_year,
	industry_branch_code ,
	name AS industry_branch_name,
	payroll_year
FROM czechia_payroll AS cp 
	JOIN czechia_payroll_industry_branch AS cpib
	ON cpib.code = cp.industry_branch_code
WHERE
		value IS NOT NULL AND value_type_code = '5958'
		AND unit_code = '200'
		AND calculation_code = '100'
GROUP BY payroll_year, industry_branch_code 
ORDER BY payroll_year ;
/*
 * 2. ceny - vytvoření view
 * 		vytažení roku z datumu (date_to)
 * 		vypočet průměrné ceny (zaokrouhleno na celá čísla) podle druhu potravin (category_code) pro učitý rok
 * 	 	připojení druhů potravin (czechia_price_category)
 */

CREATE VIEW czechia_price_per_category as	
SELECT
	round(avg(value)) AS avg_value,
	name AS price_category_name,
	price_value,
	price_unit,
	YEAR (date_to) AS price_year
FROM czechia_price AS cp
	JOIN czechia_price_category AS cpc 
	ON cpc.code = cp.category_code
GROUP BY category_code, price_year;


/*
 * 3. finální vytvoření tabulky propojením view s tabulkou mezd a view s tabulkou cen
 */

CREATE TABLE t_jaroslav_cermak_project_SQL_primary_final
SELECT 
	*
FROM
	czechia_payroll_per_industry_branch AS cppib
	JOIN czechia_price_per_category AS cppc 
	ON cppc.price_year = cppib.payroll_year;
