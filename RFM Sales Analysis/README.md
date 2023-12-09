# Data Analysis Project: [RFM Sales Analysis]



## Table of Contents
- [Overview](#overview)
- [Dataset](#dataset)
- [Analysis](#analysis)
- [Results](#results)
- [Files](#files)


## Overview
The dataset for this analysis is related to sales. It includes information about sales ​revenue, ​customer segmentation, and ​product lines. The data is organized by various attributes such as ​sales order date, product code, customer information, territory, and deal size. The dataset covers multiple years, with the majority of the analysis focusing on the years 2003-2005. It provides insights into key metrics such as sales amount, order quantity, and revenue distribution across different dimensions such as product lines, countries, and customer segments. This analysis is valuable for anyone involved in strategic decision-making, sales management, marketing, and overall business planning. It provides actionable insights into various dimensions of sales data, empowering stakeholders to optimize their approaches and drive business success.

## Tools Used
* Microsoft SQL Server 
* Tableau Public
* kaggle.com
* CSV file

## Dataset
The dataset is in ​CSV format and consists of multiple columns such as ​order number, ​sales price, ​sales order date, product line, customer information, and more. The dataset has been preprocessed before analysis, including importing the CSV file into a database, performing SQL queries to retrieve relevant data, and cleaning the data by removing duplicates and selecting specific columns for analysis.
## Analysis
The SQL methods and techniques used in this analysis include common table expressions, aggregate functions, window functions, and XML Path. These were utilized to perform data manipulations, aggregations, and analysis on the sales data set.

Here are some of 

Case Statements: 


```sql

```
* Aggregation: Aggregation functions, such as SUM or MAX, are used to calculate the What city has the highest number of sales in a specific country.

```sql
select city, sum (sales) Revenue
from [PortfolioDB].[dbo].[sales_data_sample]
where country = 'UK'
group by city
order by 2 desc
```

* Partitioning: 


```sql

```

* Casting: The queries use the CAST functions to change the data type of certain columns, such as converting columns to strings so they don't get added up as numeric values. 
```sql
select 
	c.*, rfm_recency+ rfm_frequency+ rfm_monetary as rfm_cell,
	cast(rfm_recency as varchar) + cast(rfm_frequency as varchar) + cast(rfm_monetary  as varchar)rfm_cell_string
into #rfm
from rfm_calc c
```

* Sorting: The queries use the ORDER BY clause to sort the results based on specific columns, such as date, frequenct, or value. 

* Grouping: The queries use the GROUP BY clause to group the data by specific columns, such as group sales by productline.
```sql
select PRODUCTLINE, sum(sales) Revenue
from [dbo].[sales_data_sample]
group by PRODUCTLINE
order by 2 desc
```


After the data was analyzed in the database, it was downloaded and moved into Tableau for data visualization. The point of Tableau was to easily understand and visualize the massive amount of data in the file for many people to understand. 

Link below to both Sales Dashboards:

https://public.tableau.com/app/profile/nick.patel1864/vizzes
## Results


Here are some of the key findings and insights I found from this dataset:

* Analysis shows Death Percentage: The overall death percentage across the world is a about one percent at the time the data was analyzed.
* Identified that Europe suffered the most deaths from the disease with countries such as France and Austria being heavily infected.
* The region that suffered the least was Austrailia and Oceania which could be due to the fact that the population is much smaller compared to the rest of the world. Though it is important to note that Australia alone had 44% of the population infected at one point.
* North America is the 3rd highest infected population, mostly due to the U.S. leading the charge with close to 31% of the population infected at some point
* Using a forecast indicator in Tableau, I was able to find that between India, China, United States, United Kingdom, and Mexico that China is predicted to have a higher average population infected in the future comparatively to the other major countries listed.





## Files
List and briefly describe the main files in your project. For example:
- `sales_data_sample.csv`: File containing the raw and processed data files.
