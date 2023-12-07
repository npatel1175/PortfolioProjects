# Data Analysis Project: [COVID Deaths/Vaccinations Analysis]



## Table of Contents
- [Overview](#overview)
- [Dataset](#dataset)
- [Analysis](#analysis)
- [Results](#results)
- [Files](#files)


## Overview
The project focuses on analyzing a dataset on COVID-19 apps to gain insights  for app researchers and scientist based on the findings. The data for the project was found on the Our World In Data website. This analysis is great for an people in the research and/or medical field.
## Tools Used
* Microsoft SQL Server 
* Tableau Public
* ourworldindata.org
* CSV file

## Dataset
The dataset used in the analysis is about global information regarding COVID-19 starting from January 2020. It contains information such as total_cases, total_deaths, population, location, etc. The dataset is sourced from ourworldindata.org and is in Excel file format. The data is analyzed using SQL queries in Microsoft SQL Server. The file was originally in one Excel file but to make it work better, the file was adjusted. Columns related to vaccinations and new testing were separated into another file. This includes columns from new_tests and everything to the right of it besides the population column. 
## Analysis
The files were uploaded into the same database called PortfolioProject in order to work with both tables. Considering how large this dataset is, there were a multitude of methods and techniques used when analyzing the data. Some of the methods include the following:

* Joins: The queries use join operations to combine the data from multiple tables based on a common column, such as location and date

(looking at total population vs vaccinations)
```sql
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(cast(vac.new_vaccinations as BIGINT)) OVER (Partition by dea.location Order by dea.location, dea.Date) as RollingPeopleVaccinated
from PortfolioPR..CovidDeathSheet$ dea
join PortfolioPR..CovidVACSheet$ vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
order by 2,3
```
* Aggregation: Aggregation functions, such as SUM and MAX, are used to calculate the total number of new cases, total deaths, and total vaccinations across different dates and locations.

(global numbers)

```sql
select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentageGlobal
from PortfolioPR..CovidDeathSheet$
where continent is not null
order by 1,2
```

* Partitioning: The PARTITION BY clause is used to divide the data into separate partitions based on the location. This allows the calculations to be performed separately for each location.

(looking at total population vs vaccinations)
```sql
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(cast(vac.new_vaccinations as BIGINT)) OVER (Partition by dea.location Order by dea.location, dea.Date) as RollingPeopleVaccinated
from PortfolioPR..CovidDeathSheet$ dea
join PortfolioPR..CovidVACSheet$ vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
order by 2,3
```

* Filtering: The queries use WHERE clauses to filter the data based on specific conditions, such as excluding the world and continent rows, and selecting only non-null values for the continent column.

* Casting and Conversion: The queries use the CAST and CONVERT functions to change the data type of certain columns, such as converting the total deaths column from NVARCHAR to integer to enable aggregation calculations.

(Looking at the total cases vs total deaths.
Shows likelihood of dying if you contract covid in your country)
```sql
select Location, date, total_cases, total_deaths, (cast(total_deaths as decimal))/ cast(total_cases as decimal)*100 as DeathPercentage
from PortfolioPR..CovidDeathSheet$
Where location like '%states%'
and continent is not null
order by 1,2
```

* Sorting: The queries use the ORDER BY clause to sort the results based on specific columns, such as date, location, or population, in ascending or descending order.

* Grouping: The queries use the GROUP BY clause to group the data by specific columns, such as date or location, which allows for the aggregation calculations to be performed on each group separately.

After the data was analyzed in the database, it was downloaded and moved into Tableau for data visualization. The point of Tableau was to easily understand and visualize the massive amount of data in the file for many people to understand. 

Link below:

https://public.tableau.com/app/profile/nick.patel1864/viz/CovidDashboard_16955004224530/Dashboard1
## Results


Here are some of the key findings and insights I found from this dataset:

* Analysis shows Death Percentage: The overall death percentage across the world is a about one percent at the time the data was analyzed.
* Identified that Europe suffered the most deaths from the disease with countries such as France and Austria being heavily infected.
* The region that suffered the least was Austrailia and Oceania which could be due to the fact that the population is much smaller compared to the rest of the world. Though it is important to note that Australia alone had 44% of the population infected at one point.
* North America is the 3rd highest infected population, mostly due to the U.S. leading the charge with close to 31% of the population infected at some point
* Using a forecast indicator in Tableau, I was able to find that between India, China, United States, United Kingdom, and Mexico that China is predicted to have a higher average population infected in the future comparatively to the other major countries listed.





## Files
List and briefly describe the main files in your project. For example:
- `CovidVACSheet.xlsx`: File containing the raw and processed data files.
- `CovidDeathSheet.xlsx`: File containing the raw and processed data files.
