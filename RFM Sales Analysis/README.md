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

Here are some of the sql techniques:

* Aggregation: Aggregation functions, such as SUM or MAX, are used to calculate the What city has the highest number of sales in a specific country.

```sql
select city, sum (sales) Revenue
from [PortfolioDB].[dbo].[sales_data_sample]
where country = 'UK'
group by city
order by 2 desc
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

* First, the best-selling product line is classic cars, followed by vintage cars. 

* November emerged as the best month for sales, with higher revenue generated during that time. 

* Medium-sized deals were found to generate the most revenue, suggesting the need for targeted marketing strategies for this segment. 

* The United States was the top revenue-generating country, with France and Spain also showing significant sales. 

* The year 2004 stood out as a particularly successful year for sales. 

* Additionally, the analysis uncovered a strong correlation between certain products being sold together, indicating the potential for bundled sales strategies. 

* Finally, using RFM (Recency, Frequency, Monetary) analysis helped identify high-value and loyal customers, which can be leveraged for targeted marketing and retention efforts.

## Files
List and briefly describe the main files in your project. For example:
- `sales_data_sample.csv`: File containing the raw and processed data files.
