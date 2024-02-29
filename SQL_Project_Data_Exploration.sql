--Sample query

SELECT c.shortname, i.IndicatorName, i.YEAR, i.value 
FROM Country c
JOIN indicators i ON c.CountryCode = i.CountryCode
WHERE c.ShortName in ('United Kingdom', 'United States', 'China')
AND i.IndicatorName = 'CO2 emissions (kt)';

--Ordered by YEAR 
SELECT c.shortname, i.IndicatorName, i.YEAR, i.value 
FROM Country c
JOIN indicators i ON c.CountryCode = i.CountryCode
WHERE c.ShortName in ('United Kingdom', 'United States', 'China')
AND i.IndicatorName = 'CO2 emissions (kt)'
ORDER BY i.YEAR; 

------------

--What categories are under SystemOfNationalAccounts in country table  
---to help filter out non-country categories in the following statement

SELECT SystemOfNationalAccounts 
FROM Country  

--Refugee population by country of origin, ordered by value, all years 
WITH indicator_countries
AS (
SELECT *
FROM Indicators i
LEFT JOIN Country c ON i.CountryCode = c.CountryCode 
)
SELECT ShortName , IndicatorName , Year, Value 
FROM indicator_countries 
WHERE SystemOfNationalAccounts LIKE 'C%' 
AND IndicatorName = 'Refugee population by country or territory of origin'
ORDER BY Value DESC 

--Max country for refugees by country/territory of origin per year 
WITH indicator_countries
AS (
SELECT *
FROM Indicators i
LEFT JOIN Country c ON i.CountryCode = c.CountryCode 
)
SELECT ShortName , IndicatorName , Year, max(Value) 
FROM indicator_countries 
WHERE SystemOfNationalAccounts LIKE 'C%' 
AND IndicatorName = 'Refugee population by country or territory of origin'
GROUP BY Year
ORDER BY Year DESC 

--Grouped by Country, ordered by year
WITH indicator_countries
AS (
SELECT *
FROM Indicators i
LEFT JOIN Country c ON i.CountryCode = c.CountryCode 
)
SELECT ShortName , IndicatorName , Year, max(Value) 
FROM indicator_countries 
WHERE SystemOfNationalAccounts LIKE 'C%' 
AND IndicatorName = 'Refugee population by country or territory of origin'
GROUP BY ShortName
ORDER BY year DESC 

--Refugee population by country of asylum, ordered by value, all years 
WITH indicator_countries
AS (
SELECT *
FROM Indicators i
LEFT JOIN Country c ON i.CountryCode = c.CountryCode 
)
SELECT ShortName , IndicatorName , Year, Value 
FROM indicator_countries 
WHERE SystemOfNationalAccounts LIKE 'C%' 
AND IndicatorName = 'Refugee population by country or territory of asylum'
ORDER BY Value DESC 

--Numbers of refugees in the United States
WITH indicator_countries
AS (
SELECT *
FROM Indicators i
LEFT JOIN Country c ON i.CountryCode = c.CountryCode 
)
SELECT ShortName AS Country , IndicatorName , Year, max(Value) AS Value
FROM indicator_countries 
WHERE SystemOfNationalAccounts LIKE 'C%' 
AND IndicatorName = 'Refugee population by country or territory of asylum'
AND ShortName IN ('United States')
GROUP BY Year

--Net migration in the united states
WITH indicator_countries
AS (
SELECT *
FROM Indicators i
LEFT JOIN Country c ON i.CountryCode = c.CountryCode 
)
SELECT ShortName AS Country , IndicatorName , Year, max(Value) AS Value
FROM indicator_countries 
WHERE SystemOfNationalAccounts LIKE 'C%' 
AND IndicatorName = 'Net migration'
AND ShortName IN ('United States')
GROUP BY YEAR

--international migration stock
WITH indicator_countries
AS (
SELECT *
FROM Indicators i
LEFT JOIN Country c ON i.CountryCode = c.CountryCode 
)
SELECT *
FROM indicator_countries 
WHERE SystemOfNationalAccounts LIKE 'C%' 
AND IndicatorName = 'International migrant stock, total'


--Top 10 countries with droughts, floods, extreme temps (avg 1990-2009)
SELECT * 
FROM Indicators i 
WHERE IndicatorName = 'Droughts, floods, extreme temperatures (% of population, average 1990-2009)'
ORDER BY Value DESC 
LIMIT 10 

--
--Total population of the United States over the years
SELECT CountryName , "Year" , Value  
FROM Indicators i 
WHERE IndicatorName = 'Population, total'
AND i.CountryName IN ('United States')
ORDER BY "Year" 

--
--Total CO2 emissions in the World by year 
SELECT CountryName , IndicatorName , YEAR, Value 
FROM Indicators i 
WHERE CountryName in ('World')
AND IndicatorName = 'CO2 emissions (kt)';

--personal remittances, received (% of GDP) by country 
WITH indicator_countries
AS (
SELECT *
FROM Indicators i
LEFT JOIN Country c ON i.CountryCode = c.CountryCode 
)
SELECT ShortName , IndicatorName , Year, max(Value) AS Value
FROM indicator_countries 
WHERE SystemOfNationalAccounts LIKE 'C%' 
AND IndicatorName = 'Personal remittances, received (% of GDP)'
GROUP BY ShortName
ORDER BY Value DESC 

--Personal remittances, paid (current US$) in the US 
WITH indicator_countries
AS (
SELECT *
FROM Indicators i
LEFT JOIN Country c ON i.CountryCode = c.CountryCode 
)
SELECT ShortName , IndicatorName , Year, Value
FROM indicator_countries 
WHERE SystemOfNationalAccounts LIKE 'C%' 
AND IndicatorName = 'Personal remittances, paid (current US$)'
AND shortname IN ('United States')
------

--El Salvador--

--Refugees in El Salvador
SELECT CountryName, YEAR, Value
FROM Indicators i 
WHERE CountryName IN ('El Salvador')
AND IndicatorName = 'Refugee population by country or territory of asylum'

--Refugee population by country or territory of origin (from El Salvador)
SELECT CountryName, YEAR, Value
FROM Indicators i 
WHERE CountryName IN ('El Salvador')
AND IndicatorName = 'Refugee population by country or territory of origin'


--Net migration in El Salvador
SELECT CountryName, YEAR, Value
FROM Indicators i 
WHERE CountryName IN ('El Salvador')
AND IndicatorName = 'Net migration'

--GDP growth (annual %) in El Salvador
SELECT CountryName, YEAR, Value
FROM Indicators i 
WHERE CountryName IN ('El Salvador')
AND IndicatorName = 'GDP growth (annual %)'

SELECT CountryName, YEAR, Value
FROM Indicators i 
WHERE CountryName IN ('El Salvador')
AND IndicatorName = 'GDP growth (annual %)'

--GDP growth (annual %) in the US 
SELECT CountryName, YEAR, Value
FROM Indicators i 
WHERE CountryName IN ('United States')
AND IndicatorName = 'GDP growth (annual %)'

--GDP growth El Salvador and the US
 

--Personal remittances, received (% of GDP) in El Salvador
SELECT CountryName, YEAR, Value
FROM Indicators i 
WHERE CountryName IN ('El Salvador')
AND IndicatorName = 'Personal remittances, received (% of GDP)'

--Life expectancy in El Salvador
SELECT CountryName, YEAR, Round (Value, 2)
FROM Indicators i 
WHERE CountryName IN ('El Salvador')
AND IndicatorName = 'Life expectancy at birth, total (years)'

--Cause of death, by injury (% of total) El Salvador
SELECT CountryName, YEAR, Value
FROM Indicators i 
WHERE CountryName IN ('El Salvador')
AND IndicatorName = 'Cause of death, by injury (% of total)'
--not enough data

--(El Salvador)Completeness of total death reporting 
--(% of reported total deaths to estimated total deaths)
SELECT CountryName, YEAR, Value
FROM Indicators i 
WHERE CountryName IN ('El Salvador')
AND IndicatorName = 'Completeness of total death reporting (% of reported total deaths to estimated total deaths)'
--not enough data 

--Prevalence of undernourishment (% of population) in El Salvador
SELECT CountryName, YEAR, Value
FROM Indicators i 
WHERE CountryName IN ('El Salvador')
AND IndicatorName = 'Prevalence of undernourishment (% of population)'

--Death rate, crude (per 1,000 people) in El Salvador
SELECT CountryName, YEAR, SUM((Value/1000)) AS Death_rate
FROM Indicators i 
WHERE CountryName IN ('El Salvador')
AND IndicatorName = 'Death rate, crude (per 1,000 people)'
GROUP BY YEAR 

SELECT CountryName, YEAR, Value AS Death_rate
FROM Indicators i 
WHERE CountryName IN ('El Salvador')
AND IndicatorName = 'Death rate, crude (per 1,000 people)'
GROUP BY YEAR 

--Battle-related deaths (number of people) in El Salvador
SELECT CountryName, YEAR, Value
FROM Indicators i 
WHERE CountryName IN ('El Salvador')
AND IndicatorName = 'Battle-related deaths (number of people)'

--Military expenditure (% of GDP)
SELECT CountryName, YEAR, ROUND(Value ,2) AS Percent_of_GDP
FROM Indicators i 
WHERE CountryName IN ('El Salvador')
AND IndicatorName = 'Military expenditure (% of GDP)'

--Emigration rate of tertiary educated
SELECT CountryName, YEAR, Value
FROM Indicators i 
WHERE CountryName IN ('El Salvador')
AND IndicatorName = 'Emigration rate of tertiary educated (% of total tertiary educated population)'
--not enough data 


--Poverty gap at national poverty lines (%)
SELECT CountryName, YEAR, Value
FROM Indicators i 
WHERE CountryName IN ('El Salvador')
AND IndicatorName = 'Poverty gap at national poverty lines (%)'
--no data 


--Arms imports
SELECT CountryName, YEAR, Value
FROM Indicators i 
WHERE CountryName IN ('El Salvador')
AND IndicatorName = 'Arms imports (SIPRI trend indicator values)'

--GINI INDEX 
SELECT CountryName, YEAR, Value
FROM Indicators i 
WHERE CountryName IN ('El Salvador')
AND IndicatorName = 'GINI index (World Bank estimate)'
