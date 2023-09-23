select *
from PortfolioPR..CovidDeathSheet$
where continent is not null
order by 3,4

--select *
--from PortfolioPR..CovidVACSheet$
--order by 3,4

--select data that we are using

select Location, date, total_cases, new_cases, total_deaths, population
from PortfolioPR..CovidDeathSheet$
where continent is not null
order by 1,2


-- Looking at the total cases vs total deaths
--Shows likelihood of dying if you contract covid in your country

select Location, date, total_cases, total_deaths, (cast(total_deaths as decimal))/ cast(total_cases as decimal)*100 as DeathPercentage
from PortfolioPR..CovidDeathSheet$
Where location like '%states%'
and continent is not null
order by 1,2


--Looking at total cases vs the population
--shows what percentage of population got Covid
select Location, date, population, total_cases, (cast(total_cases as decimal))/ cast(population as decimal)*100 as PercentPopulationInfected
from PortfolioPR..CovidDeathSheet$
Where location like '%states%'
order by 1,2


--looking at countries with highest infection rate compared to population

select Location, population, MAX(total_cases) as HighestInfectionCount, MAX(total_cases) / population *100 as PercentPopulationInfected
from PortfolioPR..CovidDeathSheet$
group by Location, population
order by PercentPopulationInfected desc

--Showing countries with the highest death count per population

select Location, MAX(cast(Total_deaths as int)) as TotalDeathCount
from PortfolioPR..CovidDeathSheet$
where continent is not null 
group by Location
order by TotalDeathCount desc

-- breaking things down by continent
select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
from PortfolioPR..CovidDeathSheet$
where continent is not null 
group by continent
order by TotalDeathCount desc



--Global Numbers

select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentageGlobal
from PortfolioPR..CovidDeathSheet$
where continent is not null
order by 1,2


--looking at total population vs vaccinations


select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(cast(vac.new_vaccinations as BIGINT)) OVER (Partition by dea.location Order by dea.location, dea.Date) as RollingPeopleVaccinated
from PortfolioPR..CovidDeathSheet$ dea
join PortfolioPR..CovidVACSheet$ vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
order by 2,3


--USE CTE

With PopvsVac (Continent, location, date, population, new_vaccinations, RollingPeopleVaccinated)
as
(
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(cast(vac.new_vaccinations as BIGINT)) OVER (Partition by dea.location Order by dea.location, dea.Date) as RollingPeopleVaccinated
from PortfolioPR..CovidDeathSheet$ dea
join PortfolioPR..CovidVACSheet$ vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3
)
Select *, (RollingPeopleVaccinated/population)*100
From PopvsVac



--TEMP TABLE

DROP Table if exists #PercentPopulationVaccinated
Create table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
new_vaccinations numeric,
RollingPeopleVaccinated numeric
)

Insert into #PercentPopulationVaccinated
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(cast(vac.new_vaccinations as BIGINT)) OVER (Partition by dea.location Order by dea.location, dea.Date) as RollingPeopleVaccinated
from PortfolioPR..CovidDeathSheet$ dea
join PortfolioPR..CovidVACSheet$ vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3


Select *, (RollingPeopleVaccinated/population)*100
From #PercentPopulationVaccinated


--creating view to store data for later visualizations

Create view PercentPopulationVaccinated as
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(cast(vac.new_vaccinations as BIGINT)) OVER (Partition by dea.location Order by dea.location, dea.Date) as RollingPeopleVaccinated
from PortfolioPR..CovidDeathSheet$ dea
join PortfolioPR..CovidVACSheet$ vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3


select *
from PercentPopulationVaccinated