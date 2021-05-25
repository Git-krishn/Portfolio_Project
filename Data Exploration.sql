/*
Covid 19 Data Exploration 
Skills used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types
*/

Select *
From [Covid_database].[dbo].[Covid_deaths$]
Where continent is not null 
order by 3,4

-- Select Data that we are going to be starting with

Select Location, date, total_cases, new_cases, total_deaths, population
From [Covid_database].[dbo].[Covid_deaths$]
Where continent is not null 
order by 1,2

-- Total Cases vs Total Deaths

-- Shows likelihood of dying if you contract covid in India

Select Location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 as Death_Percentage
From [Covid_database].[dbo].[Covid_deaths$]
Where location = "INDIA"
and continent is not null 
order by 1,2

-- Total Cases vs Population

-- Shows what percentage of population infected with Covid

Select Location, date, Population, total_cases,  (total_cases/population)*100 as Percent_Population_Infected
From [Covid_database].[dbo].[Covid_deaths$]
order by 1,2

-- Countries with Highest Infection Rate compared to Population

Select Location, Population, MAX(total_cases) as Highest_Infection_Count,  Max((total_cases/population))*100 as Percent_Population_Infected
From [Covid_database].[dbo].[Covid_deaths$]
Group by Location, Population
order by Percent_Population_Infected desc

-- Countries with Highest Death Count per Population

Select Location, MAX(cast(Total_deaths as int)) as Total_Death_Count
From [Covid_database].[dbo].[Covid_deaths$]
Where continent is not null 
Group by Location
order by Total_Death_Count desc

-- BREAKING THINGS DOWN BY CONTINENT

-- Showing contintents with the highest death count per population

Select continent, MAX(cast(Total_deaths as int)) as Total_Death_Count
From [Covid_database].[dbo].[Covid_deaths$]
Where continent is not null 
Group by continent
order by Total_Death_Count desc


