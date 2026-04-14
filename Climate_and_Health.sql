-- 1 : Query: Region-wise Total Heat Illnesses
SELECT
    region,
    ROUND(SUM(heat_related_illnesses)::numeric, 2) AS total_heat_illnesses
FROM climate
GROUP BY region
ORDER BY total_heat_illnesses DESC;

-- 2 : Average Respiratory Disease Rate by Region
SELECT
    region,
    ROUND(AVG(respiratory_disease_rate)::numeric, 2) AS avg_respiratory_rate
FROM climate
GROUP BY region
ORDER BY avg_respiratory_rate DESC;

-- 3 : Top 5 Countries with Highest Respiratory Disease Rate
SELECT
    country_name,
    ROUND(AVG(respiratory_disease_rate)::numeric, 2) AS avg_respiratory_rate
FROM climate
GROUP BY country_name
ORDER BY avg_respiratory_rate DESC
LIMIT 5;

-- 4 : Region-wise Heat Illnesses per 100k Population
SELECT
    region,
    ROUND(
        SUM(heat_related_illnesses)::numeric 
        / SUM(population_millions) * 100000,
        2
    ) AS heat_illness_rate_per_100k
FROM climate
GROUP BY region
ORDER BY heat_illness_rate_per_100k DESC;

-- 5 : Countries by Total Extreme Weather Events
SELECT
    country_name,
    SUM(extreme_weather_events) AS total_extreme_events
FROM climate
GROUP BY country_name
ORDER BY total_extreme_events DESC;
-- LIMIT 5;

-- 6 : ECONOMIC STATUS VS HEALTHCARE ACCESS
-- Average GDP per Capita by Income Level
WITH economic_summary AS (
    SELECT
        income_level,
        ROUND(AVG(gdp_per_capita_usd)::numeric, 2) AS avg_gdp_per_capita
    FROM climate
    GROUP BY income_level
)
SELECT
    income_level,
    avg_gdp_per_capita
FROM economic_summary
ORDER BY avg_gdp_per_capita DESC;

-- 7 : Healthcare Access Comparison
WITH healthcare_access_summary AS (
    SELECT
        income_level,
        ROUND(AVG(healthcare_access_index)::numeric, 2) AS avg_healthcare_access
    FROM climate
    GROUP BY income_level
)
SELECT
    income_level,
    avg_healthcare_access
FROM healthcare_access_summary
ORDER BY avg_healthcare_access DESC;
 
-- 8 : RISING TEMPERATURE IS INCREASING HEAT-RELATED ILLNESSES
--	   "As average temperature rises year over year, heat-related illnesses also increase significantly,
--     indicating a direct health impact of climate warming."

SELECT
    year,
    ROUND(AVG(temperature_celsius)::numeric, 2) AS avg_temperature,
    ROUND(AVG(heat_related_illnesses)::numeric, 2) AS avg_heat_illnesses
FROM climate
GROUP BY year
ORDER BY year;

-- 9 : POOR AIR QUALITY DRIVES RESPIRATORY DISEASES
--	   "Regions with higher PM2.5 pollution levels experience substantially higher respiratory disease rates,
--	    highlighting air pollution as a major public health risk."

SELECT
    region,
    ROUND(AVG(pm25_ugm3)::numeric, 2) AS avg_pm25,
    ROUND(AVG(respiratory_disease_rate)::numeric, 2) AS avg_respiratory_rate
FROM climate
GROUP BY region
ORDER BY avg_pm25 DESC;

-- 10 : EXTREME WEATHER EVENTS INCREASE VECTOR-BORNE DISEASE RISK
--	   "Increasing extreme weather events create favorable conditions for vector-borne diseases, 
--	    resulting in a steady rise in disease risk over time."

SELECT
    year,
    SUM(extreme_weather_events) AS total_extreme_events,
    ROUND(AVG(vector_disease_risk_score)::numeric, 2) AS avg_vector_risk
FROM climate
GROUP BY year
ORDER BY year;

-- 11 : ECONOMIC INEQUALITY AFFECTS HEALTHCARE ACCESS AND HEAT ILLNESSES
--		"Lower-income countries experience higher heat-related illness rates due to weaker healthcare 
--		access and limited adaptive capacity"

SELECT
    income_level,
    ROUND(SUM(heat_related_illnesses::numeric * population_millions::numeric) / SUM(population_millions::numeric), 2) AS weighted_heat_risk,
    ROUND(AVG(gdp_per_capita_usd)::numeric, 2) AS avg_gdp,
    ROUND(AVG(healthcare_access_index)::numeric, 2) AS avg_healthcare_access
FROM climate
WHERE heat_wave_days > 0
GROUP BY income_level
ORDER BY weighted_heat_risk DESC;


-- 12 : IDENTIFYING HIGH-RISK COUNTRIES (PRIORITIZATION)
--		"A small group of countries consistently shows the highest burden of heat-related illnesses, 
--		making them priority targets for climate adaptation and public health interventions."

SELECT
    country_name,
    ROUND(
        SUM(
            heat_related_illnesses::numeric * population_millions::numeric
        ) / SUM(population_millions::numeric),
        2
    ) AS heat_illness_rate_per_100k,
    RANK() OVER (
        ORDER BY SUM(heat_related_illnesses::numeric * population_millions::numeric) / SUM(population_millions::numeric) DESC
    ) AS risk_rank
FROM climate
WHERE heat_wave_days > 0
GROUP BY country_name
ORDER BY risk_rank
LIMIT 5;
