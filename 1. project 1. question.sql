SELECT 
	*
FROM payroll_calculation_industry_branch_code_a AS pcibca ;

SELECT
    sum(`cp`.`value`) AS `value_sum`,
    `cp`.`industry_branch_code` AS `industry_branch_code`,
    `cp`.`payroll_year` AS `payroll_year`
FROM
    `engeto_09_2024`.`czechia_payroll` `cp`
WHERE
    `cp`.`industry_branch_code` = 'A'
GROUP BY
    `cp`.`payroll_year`;
   
 CREATE VIEW payroll_calculation_industry_branch_code_b AS
   SELECT
 	sum(value) AS value_sum,
 	industry_branch_code,
 	payroll_year 
FROM czechia_payroll AS cp
WHERE industry_branch_code = 'B'
GROUP BY payroll_year ;


-- creation of 1st table

SELECT
	*
FROM czechia_payroll AS cp 
JOIN czechia_payroll_industry_branch AS cpib
	ON cpib.code = cp.industry_branch_code ;
