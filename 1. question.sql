/* Otázka č.1 Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?	
*/

-- mzdy pro určité odvětví a učitý rok

SELECT
	payroll_per_year,
	industry_branch_code,
	industry_branch_name,
	payroll_year,
	LAG(payroll_per_year) OVER (
								PARTITION BY industry_branch_code
								ORDER BY payroll_year) AS previous_year, 
	payroll_per_year - LAG(payroll_per_year) OVER (PARTITION BY industry_branch_code ORDER BY payroll_year) AS payroll_difference,
	CASE 
		WHEN payroll_per_year - LAG(payroll_per_year) OVER (PARTITION BY industry_branch_code ORDER BY payroll_year) > 0 THEN 'increase' 
		WHEN payroll_per_year - LAG(payroll_per_year) OVER (PARTITION BY industry_branch_code ORDER BY payroll_year) < 0 THEN 'decrease'
		WHEN payroll_per_year - LAG(payroll_per_year) OVER (PARTITION BY industry_branch_code ORDER BY payroll_year) = 0 THEN 'stagnation'
	END	AS trend
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf
GROUP BY industry_branch_code, payroll_year
ORDER BY industry_branch_code, payroll_year;