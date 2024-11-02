# SQL-project-1
---
## Projekt v rámci kurzu Datová analýza 26.09.2024 zabývající se výzkumnými otázkami ohledně životní úrovně občanů a dostupností základních potravin.

**Úvod do projektu**
Na analytickém oddělení nezávislé společnosti, která se zabývá životní úrovní občanů, jsme se rozhodli odpovědět na několik definovaných výzkumných otázek týkajících se dostupnosti základních potravin pro širokou veřejnost. Tento projekt má za cíl poskytnout robustní datové podklady, které umožní porovnání dostupnosti potravin na základě průměrných příjmů za určité časové období.

**Výzkumné otázky**
1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?

**Výstupy projektu**
Výstupem projektu budou dvě hlavní tabulky v databázi, ze kterých se požadovaná data dají získat:

- t_{jmeno}_{prijmeni}_project_SQL_primary_final: Data o mzdách a cenách potravin za Českou republiku sjednocených na totožné porovnatelné období.
- t_{jmeno}_{prijmeni}_project_SQL_secondary_final: Dodatečná data o dalších evropských státech.

**SQL Skripty**
Připravíme sadu SQL skriptů, které z výše uvedených tabulek získají datový podklad k odpovězení na vytyčené výzkumné otázky.

