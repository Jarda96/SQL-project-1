# SQL-project-1
---
github name: Jarda96

discord name: jarek.cermak
---
## Zadání projektu v rámci kurzu datová analýza by Engeto Academy

**Úvod do projektu**

Na analytickém oddělení nezávislé společnosti, která se zabývá životní úrovní občanů, jsme se rozhodli odpovědět na několik definovaných výzkumných otázek týkajících se dostupnosti základních potravin pro širokou veřejnost. Tento projekt má za cíl poskytnout robustní datové podklady, které umožní porovnání dostupnosti potravin na základě průměrných příjmů za určité časové období.

**Výzkumné otázky**

1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?

**Výstupy projektu**

Výstupem projektu budou dvě hlavní tabulky v databázi, ze kterých se požadovaná data dají získat:

- t_{jmeno}_{prijmeni}_project_SQL_primary_final: Data o mzdách a cenách potravin za Českou republiku sjednocených na totožné porovnatelné období.
- t_{jmeno}_{prijmeni}_project_SQL_secondary_final: Dodatečná data o dalších evropských státech.

**SQL Skripty**

Připravíme sadu SQL skriptů, které z výše uvedených tabulek získají datový podklad k zodpovězení na vytyčené výzkumné otázky.

---

## Odpovědi na výzkumné otázky:

### 1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

V rámci výzkumné otázky jsme použili data mezd 19 odvětví v České republice mezi lety 2006 až 2018. Z analýzy vyplývá, že mzdy v průběhu let vykazují růst ve většině odvětví, ale jsou zde i určité sektory, kde dochází k poklesům.

- Odvětví s pravidelným každoročním růstem: Sektory C (Zpracovatelský průmysl), H (Doprava a skladování), N (Administrativní a podpůrné činnosti), Q (Zdravotní a sociální péče), S (Ostatní činnosti)

- Převážně růst s občasnými poklesy: Většina ostatních sektorů, například sektor A (Zemědělství), sektor E (Zásobování vodou), sektor F (Stavebnictví), sektor G (Velkoobchod a maloobchod), sektor I (Ubytování a stravování), sektor J (Informační a komunikační činnosti), sektor L (Činnosti v oblasti nemovitostí), sektor M (Profesní, vědecké a technické činnosti), sektor P (Vzdělávání), sektor R (Kulturní a zábavní činnosti)

- Výraznější období poklesu: Sektory B (Těžba a dobývání), D (Výroba a rozvod elektřiny) a K (Peněžnictví a pojišťovnictví) zažily významné poklesy mezi lety 2013-2016.

Celkově lze říci, že mzdy v různých odvětvích obecně rostou. To ukazuje na pozitivní trend. Přesto existují specifická období a sektory, kde došlo k poklesu. Nejčastější pokles byl zaznamenán v letech 2009 a 2013.


**Níže naleznete jednotlivá odvětví a jejich poklesy:**

Mzdy pro sektor A: Zemědělství, lesnictví, rybářství
- kromě roku 2009 mzdy v průběhu let rostou

Mzdy pro sektor B: Těžba a dobývání
- v roce 2009 pokles, poté růst a mezi lety 2013 a 2016 pokles (2015 lehký růst)
- od roku 2017 růst

Mzdy pro sektor C: Zpracovatelský průmysl
- každoroční růst

Mzdy pro sektor D: Výroba a rozvod elektřiny, plynu, tepla a klimatiz. vzduchu
- v letech 2013 a 2015 pokles, jinak růst

Mzdy pro sektor E: Zásobování vodou; činnosti související s odpady a sanacemi
- kromě roku 2013 mzdy v průběhu let rostou

Mzdy pro sektor F: Stavebnictví
- kromě roku 2013 mzdy v průběhu let rostou

Mzdy pro sektor G: Velkoobchod a maloobchod; opravy a údržba motorových vozidel
- kromě let 2009 a 2013 mzdy v průběhu let rostou

Mzdy pro sektor H: Doprava a skladování
- každoroční růst

Mzdy pro sektor I: Ubytování, stravování a pohostinství
- kromě let 2009 a 2011 mzdy v průběhu let rostou

Mzdy pro sektor J: Informační a komunikační činnosti
- kromě roku 2013 mzdy v průběhu let rostou

Mzdy pro sektor K: Peněžnictví a pojišťovnictví
- kromě roku 2013 mzdy v průběhu let rostou (zajímavostí je, že až v roce 2017 se dostávají nad mzdy z roku 2012)

Mzdy pro sektor L: Činnosti v oblasti nemovitostí
- kromě roku 2013 mzdy v průběhu let rostou

Mzdy pro sektor M: Profesní, vědecké a technické činnosti
- kromě roku 2010 a 2013 mzdy v průběhu let rostou

Mzdy pro sektor N: Administrativní a podpůrné činnosti
- každoroční růst

Mzdy pro sektor O: Veřejná správa a obrana; povinné sociální zabezpečení
- v 2010 a 2011 pokles, poté růst (zajímavostí je, že až v roce 2014 se dostávají nad mzdy z roku 2009)

Mzdy pro sektor P: Vzdělávání
- kromě roku 2010 mzdy v průběhu let rostou

Mzdy pro sektor Q: Zdravotní a sociální péče
- každoroční růst

Mzdy pro sektor R: Kulturní, zábavní a rekreační činnosti
- kromě roku 2011 a 2013 mzdy v průběhu let rostou

Mzdy pro sektor S: Ostatní činnosti
- každoroční růst


### 2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

V rámci výzkumné otázky jsme použili data průměrných mezd v České republice a ceny potravin pro počáteční rok 2006 a poslední rok 2018. Z porovnání vyplývá, že v roce 2018 bylo možné si koupit více mléka i chleba než v roce 2006, což by mohlo naznačovat zlepšení kupní síly obyvatel během tohoto období.

- V roce 2006: Bylo možné si koupit 1453 litrů mléka a 1271 kilogramů chleba.
- V roce 2018: Bylo možné si koupit 1599 litrů mléka a 1333 kilogramů chleba.


### 3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?

V rámci výzkumné otázky jsme použili data průměrných cen potravin v České republice mezi lety 2006 až 2018. Z analýzy vyplývá, že nejpomaleji zdražující kategorií potravin je vepřová pečeně s kostí a banány (0,9 %), zatímco krystalový cukr dokonce zlevnil (2 %).
Pro informaci, nejrychleji zdražující potravinou jsou papriky (7,3 %).


### 4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?

V rámci výzkumné otázky jsme analyzovali data cen potravin a výšky mezd v České republice za období od roku 2006 do 2018. Výsledky analýzy ukazují, že v žádném z těchto let nebyl meziroční nárůst cen potravin výrazně vyšší než růst mezd, konkrétně nebyl větší než 10 %.
K meziročnímu nárůstu cen potravin došlo v letech 2007-2008, 2010-2015 a 2017. Dokonce v letech 2012-2013, 2015 a 2017 převýšil růst cen i rychlost růstu mezd. Nicméně v ostatních letech byl růst cen potravin nižší oproti růstu mezd. Největší rozdíl byl v roce 2016 (5,8 %).


### 5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?

Na základě analýzy dat z let 2006 až 2018 můžeme říci, že existuje určitá korelace mezi růstem HDP a změnami ve mzdách a cenách potravin.

Konkrétně platí, že:

- **Výrazný růst HDP** (significant GDP increase) se často pojí s výrazným růstem mezd (significant payroll increase) i cen potravin (significant price increase).

- **Normální růst HDP** (normal GDP increase) také vede k růstu mezd a cen potravin, avšak tento růst nemusí být vždy výrazný.

- **Pokles HDP** (GDP decrease) občas vede k poklesu mezd a cen potravin, i když někdy naopak může dojít ke zvýšení mezd i cen potravin navzdory poklesu HDP (například v letech 2012 a 2013).

Významný růst HDP tedy má tendenci se projevit výraznějším růstem mezd a cen potravin jak ve stejném roce, tak i v následujícím roce. Avšak ne vždy je tento vliv jednoznačný, protože některé roky s poklesem HDP ukázaly růst mezd a cen potravin.

Tato zjištění naznačují, že HDP má určitý vliv na mzdy a ceny potravin, avšak tento vliv může být ovlivněn i dalšími ekonomickými faktory.


