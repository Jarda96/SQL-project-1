-- pokus o vytvoření 1. tabulky

/*
 * 1. mzdy
 * 	připojení názvu odvětví k tabulce se mzdami
 * 	odebrání průměrného počtu zaměstnanců
 */

SELECT
	*
FROM czechia_payroll AS cp 
JOIN czechia_payroll_industry_branch AS cpib
	ON cpib.code = cp.industry_branch_code
WHERE value IS NOT NULL AND value_type_code = '5958';
