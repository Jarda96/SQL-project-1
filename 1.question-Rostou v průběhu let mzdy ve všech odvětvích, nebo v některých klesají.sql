/* 	zgrupování sumy mezd pro určité odvětví a rok
*/

-- sumy mezd pro určité odvětví 

SELECT 
	industry_branch_code ,
	name,
	sum(value) AS sum_of_payroll_per_industry_branch
FROM czechia_payroll AS cp 
	JOIN czechia_payroll_industry_branch AS cpib
	ON cpib.code = cp.industry_branch_code
WHERE 
		value IS NOT NULL AND value_type_code = '5958'
		AND unit_code = '200'
		AND calculation_code = '100'
		AND industry_branch_code BETWEEN 'A' AND 'S'
GROUP BY industry_branch_code;

-- sumy mezd pro určitý rok

SELECT 
	payroll_year,
	sum(value) AS sum_of_payroll_per_year
FROM czechia_payroll AS cp 
	JOIN czechia_payroll_industry_branch AS cpib
	ON cpib.code = cp.industry_branch_code
WHERE 
		value IS NOT NULL AND value_type_code = '5958'
		AND unit_code = '200'
		AND calculation_code = '100'
		AND payroll_year BETWEEN 2000 AND 2021
GROUP BY payroll_year ;

 -- sumy mezd pro určité odvětví a určitý rok

SELECT 
	industry_branch_code ,
	name,
	payroll_year,
	sum(value) AS sum_of_payroll_per_industry_branch_and_year
FROM czechia_payroll AS cp 
	JOIN czechia_payroll_industry_branch AS cpib
	ON cpib.code = cp.industry_branch_code
WHERE 
		value IS NOT NULL AND value_type_code = '5958'
		AND unit_code = '200'
		AND calculation_code = '100'
		AND industry_branch_code BETWEEN 'A' AND 'S'
		AND payroll_year BETWEEN 2000 AND 2021
GROUP BY industry_branch_code, payroll_year ;
