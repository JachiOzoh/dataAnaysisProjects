

SELECT TOP 1000 location,date, total_cases, total_deaths,population
FROM coviddeaths
WHERE continent IS NOT NULL;

--ratio of total cases to total deaths = death rate/mortality rate
SELECT TOP 1000 location,date, total_cases, total_deaths,(total_deaths/total_cases)*100 AS death_percentage
FROM coviddeaths
WHERE continent IS NOT NULL
ORDER BY 1,2;

--filter on location = 'United States'
SELECT  location,date, total_cases, total_deaths,(total_deaths/total_cases)*100 AS death_percentage
FROM coviddeaths
WHERE location = 'United States' AND continent IS NOT NULL
ORDER BY 1,2;

--filter on location = 'Nigeria'
SELECT location,date, total_cases, total_deaths,(total_deaths/total_cases)*100 AS death_percentage
FROM coviddeaths
WHERE location = 'Nigeria' AND continent IS NOT NULL
ORDER BY 1,2;

SELECT TOP 1000 location, population, total_cases, (total_cases/population)*100 AS population_infection_perc
from coviddeaths
ORDER BY 1,2;

--investigate the highest population infection percentages
SELECT location, population, MAX(total_cases) AS highest_infection_count, MAX((total_cases/population))*100 AS population_infection_perc
FROM coviddeaths
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY population_infection_perc DESC;

--showing the countries with the highest deaths per population
SELECT location, MAX(total_deaths) AS total_death_count
FROM coviddeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY total_death_count DESC;

SELECT location, MAX(total_deaths) AS total_death_count
FROM coviddeaths
WHERE continent IS NULL
GROUP BY location
ORDER BY total_death_count DESC;

--GLOBAL TRENDS

--View sum of case and death by date
SELECT date,SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, (SUM(new_deaths)/SUM(new_cases))*100 AS death_percent
FROM coviddeaths
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY date;
--The first reported death in the data set was on 2020-01-23. There were a total of 665 reported cases on that day.


SELECT date,SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, (SUM(new_deaths)/SUM(new_cases))*100 AS death_percent
FROM coviddeaths
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY date;

--total population vs vaccinations
SELECT  dea.location, dea.date, dea.continent, population, new_vaccinations,
SUM(new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.date) AS rolling_total
FROM coviddeaths dea
JOIN covidvaccinations vac 
ON dea.location=vac.location and dea.date=vac.date
WHERE dea.continent IS NOT NULL
GROUP BY dea.location, dea.date, dea.continent, population, new_vaccinations
ORDER BY 1,2;