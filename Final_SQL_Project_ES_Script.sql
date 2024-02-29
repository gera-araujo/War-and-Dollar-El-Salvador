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