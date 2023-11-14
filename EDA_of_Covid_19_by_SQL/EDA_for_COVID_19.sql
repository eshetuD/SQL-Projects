--Author: Eshetu Deresu
--Project: Exploratory Data Analysis of COVID-19 by SQL
--Data Size: 6346 rows
--Data Features: 7 features (Columns)

USE [dbo].[data];

SELECT * FROM [dbo].[data]

-- Global Numbers - Shows Overall cases and overall death with respect to Death percentage
SELECT SUM(CAST([infected] as int)) AS 'Total Cases', SUM(CAST([dead] as int)) AS 'Total Deaths',
SUM(CAST([dead] as float))/SUM(CAST([infected] as float))*100 AS 'Death Percentage'
FROM [dbo].[data]
ORDER BY 1,2

-- Shows likelihood of a person would be died in case of he/she has been infected?
SELECT [location], SUM(CAST(dead as int)) AS 'Total Death', SUM(CAST(infected as int)) AS 'Total Infected', ROUND((SUM(CAST(dead as float))/SUM(CAST(infected as float)) * 100),2) AS 'Dead Infected Likelihood'
FROM [dbo].[data]
GROUP BY location
ORDER BY 'Dead Infected Likelihood' DESC

-- Shows likelihood of a person would be died in case of he/she has been vaccinated?
SELECT [location], SUM(CAST(dead as int)) AS 'Total Death', SUM(CAST(vaccinated as int)) AS 'Total Vaccinated', ROUND((SUM(CAST(dead as float))/SUM(CAST(vaccinated as float)) * 100),2) AS 'Dead Vaccinated Likelihood'
FROM [dbo].[data]
GROUP BY location
ORDER BY 'Dead Vaccinated Likelihood' desc;


-- Shows likelihood of a person would be infected in case of he/she has been vaccinated?
SELECT [location], SUM(CAST(infected as int)) AS 'Total Infected', SUM(CAST(vaccinated as int)) AS 'Total Vaccinated', ROUND((SUM(CAST(infected as float))/SUM(CAST(vaccinated as float)) * 100),2) AS 'Infected Vaccinated Likelihood'
FROM [dbo].[data]
GROUP BY [location]
ORDER BY 'Infected Vaccinated Likelihood' desc;


-- Which country does have the highest death rate compare to population?
SELECT [location], [population], SUM(CAST(dead AS int)) AS 'Total Death', ROUND((SUM(CAST(dead as float)/[population]) * 100),2) AS 'Highest Rate'
FROM [dbo].[data]
GROUP BY [location], [population]
ORDER BY 'Highest Rate' desc;