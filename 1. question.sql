/* Otázka č.1 Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?	
*/

-- mzdy pro určité odvětví a učitý rok

SELECT
	payroll_per_year,
	industry_branch_code,
	industry_branch_name,
	payroll_year 
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf
GROUP BY payroll_year, industry_branch_code
ORDER BY industry_branch_code, payroll_year ;


/*
 * Níže mzdy pro jednotlivá odvětví
 */

-- mzdy pro sektor A: Zemědělství, lesnictví, rybářství

SELECT
	payroll_per_year,
	industry_branch_code,
	industry_branch_name,
	payroll_year 
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf
WHERE industry_branch_code = 'A'
GROUP BY payroll_year, industry_branch_code
ORDER BY industry_branch_code, payroll_year ;

-- mzdy pro sektor B: Těžba a dobývání
SELECT
	payroll_per_year,
	industry_branch_code,
	industry_branch_name,
	payroll_year 
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf
WHERE industry_branch_code = 'B'
GROUP BY payroll_year, industry_branch_code
ORDER BY industry_branch_code, payroll_year ;

-- mzdy pro sektor C: Zpracovatelský průmysl
SELECT
	payroll_per_year,
	industry_branch_code,
	industry_branch_name,
	payroll_year 
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf
WHERE industry_branch_code = 'C'
GROUP BY payroll_year, industry_branch_code
ORDER BY industry_branch_code, payroll_year ;

-- mzdy pro sektor D: Výroba a rozvod elektřiny, plynu, tepla a klimatiz. vzduchu
SELECT
	payroll_per_year,
	industry_branch_code,
	industry_branch_name,
	payroll_year 
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf
WHERE industry_branch_code = 'D'
GROUP BY payroll_year, industry_branch_code
ORDER BY industry_branch_code, payroll_year ;

-- mzdy pro sektor E: Zásobování vodou; činnosti související s odpady a sanacemi
SELECT
	payroll_per_year,
	industry_branch_code,
	industry_branch_name,
	payroll_year 
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf
WHERE industry_branch_code = 'E'
GROUP BY payroll_year, industry_branch_code
ORDER BY industry_branch_code, payroll_year ;

-- mzdy pro sektor F: Stavebnictví
SELECT
	payroll_per_year,
	industry_branch_code,
	industry_branch_name,
	payroll_year 
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf
WHERE industry_branch_code = 'F'
GROUP BY payroll_year, industry_branch_code
ORDER BY industry_branch_code, payroll_year ;

-- mzdy pro sektor G: Velkoobchod a maloobchod; opravy a údržba motorových vozidel
SELECT
	payroll_per_year,
	industry_branch_code,
	industry_branch_name,
	payroll_year 
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf
WHERE industry_branch_code = 'G'
GROUP BY payroll_year, industry_branch_code
ORDER BY industry_branch_code, payroll_year ;

-- mzdy pro sektor H: Doprava a skladování
SELECT
	payroll_per_year,
	industry_branch_code,
	industry_branch_name,
	payroll_year 
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf
WHERE industry_branch_code = 'H'
GROUP BY payroll_year, industry_branch_code
ORDER BY industry_branch_code, payroll_year ;

-- mzdy pro sektor I: Ubytování, stravování a pohostinství
SELECT
	payroll_per_year,
	industry_branch_code,
	industry_branch_name,
	payroll_year 
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf
WHERE industry_branch_code = 'I'
GROUP BY payroll_year, industry_branch_code
ORDER BY industry_branch_code, payroll_year ;

-- mzdy pro sektor J: Informační a komunikační činnosti
SELECT
	payroll_per_year,
	industry_branch_code,
	industry_branch_name,
	payroll_year 
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf
WHERE industry_branch_code = 'J'
GROUP BY payroll_year, industry_branch_code
ORDER BY industry_branch_code, payroll_year ;

-- mzdy pro sektor K: Peněžnictví a pojišťovnictví
SELECT
	payroll_per_year,
	industry_branch_code,
	industry_branch_name,
	payroll_year 
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf
WHERE industry_branch_code = 'K'
GROUP BY payroll_year, industry_branch_code
ORDER BY industry_branch_code, payroll_year ;

-- mzdy pro sektor L: Činnosti v oblasti nemovitostí
SELECT
	payroll_per_year,
	industry_branch_code,
	industry_branch_name,
	payroll_year 
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf
WHERE industry_branch_code = 'L'
GROUP BY payroll_year, industry_branch_code
ORDER BY industry_branch_code, payroll_year ;

-- mzdy pro sektor M: Činnosti v oblasti nemovitostí
SELECT
	payroll_per_year,
	industry_branch_code,
	industry_branch_name,
	payroll_year 
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf
WHERE industry_branch_code = 'M'
GROUP BY payroll_year, industry_branch_code
ORDER BY industry_branch_code, payroll_year ;

-- mzdy pro sektor N: Administrativní a podpůrné činnosti
SELECT
	payroll_per_year,
	industry_branch_code,
	industry_branch_name,
	payroll_year 
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf
WHERE industry_branch_code = 'N'
GROUP BY payroll_year, industry_branch_code
ORDER BY industry_branch_code, payroll_year ;

-- mzdy pro sektor O: Veřejná správa a obrana; povinné sociální zabezpečení
SELECT
	payroll_per_year,
	industry_branch_code,
	industry_branch_name,
	payroll_year 
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf
WHERE industry_branch_code = 'O'
GROUP BY payroll_year, industry_branch_code
ORDER BY industry_branch_code, payroll_year ;

-- mzdy pro sektor P: Vzdělávání
SELECT
	payroll_per_year,
	industry_branch_code,
	industry_branch_name,
	payroll_year 
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf
WHERE industry_branch_code = 'P'
GROUP BY payroll_year, industry_branch_code
ORDER BY industry_branch_code, payroll_year ;

-- mzdy pro sektor Q: Zdravotní a sociální péče
SELECT
	payroll_per_year,
	industry_branch_code,
	industry_branch_name,
	payroll_year 
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf
WHERE industry_branch_code = 'Q'
GROUP BY payroll_year, industry_branch_code
ORDER BY industry_branch_code, payroll_year ;

-- mzdy pro sektor R: Kulturní, zábavní a rekreační činnosti
SELECT
	payroll_per_year,
	industry_branch_code,
	industry_branch_name,
	payroll_year 
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf
WHERE industry_branch_code = 'R'
GROUP BY payroll_year, industry_branch_code
ORDER BY industry_branch_code, payroll_year ;

-- mzdy pro sektor S: Ostatní činnosti
SELECT
	payroll_per_year,
	industry_branch_code,
	industry_branch_name,
	payroll_year 
FROM t_jaroslav_cermak_project_sql_primary_final AS tjcpspf
WHERE industry_branch_code = 'S'
GROUP BY payroll_year, industry_branch_code
ORDER BY industry_branch_code, payroll_year ;


