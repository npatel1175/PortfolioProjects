# Data Analysis Project: [Nashville Housing Data for Data Cleaning]



## Table of Contents
- [Overview](#overview)
- [Dataset](#dataset)
- [Analysis](#analysis)
- [Files](#files)


## Overview
The project focuses on data cleaning a dataset on Nashville housing information. The data for the project was found on the Kaggle website. This analysis is great for people in the real estate business and their stakeholders. Data cleaning is essential for stakeholders as it ensures the accuracy, reliability, and consistency of the data they rely on for decision-making. It contributes to more informed choices, increased trust in data-driven insights, and overall efficiency in resource allocation and utilization.

## Tools Used
* Microsoft SQL Server 
* Kaggle
* CSV file

## Dataset
The dataset used in the analysis is about the Nashville real estate market. It contains information such as LandValue, BuildingValue, Bedrooms, Bathrooms, Acreage, etc. The dataset is sourced from kaggle.com and is in Excel file format. The data is analyzed using SQL queries in Microsoft SQL Server. The dataset has a total of 56,477 rows and multiple columns, making it a comprehensive dataset for cleaning and analysis.

## Analysis
The file was uploaded into the database called PortfolioProject. Considering how large this dataset is, there were a multitude of methods and techniques used when analyzing the data. Some of the methods include the following:

* Standardizing Date Format: To standardize the date format using the CONVERT function in SQL.

```sql

```
* Breaking Apart Address Information: To use substring and character index functions to split the property address, owner address, and city into separate columns for easier analysis.

```sql

```

* Case Statements for Data Transformation: To use case statements to transform values in the "Sold as Vacant" column from "N" to "No" and from "Y" to "Yes", making the data more consistent and easier to understand.

```sql

```

* Removing Duplicate Rows: A Common Table Expression (CTE) and the ROW_NUMBER function are utilized to identify and delete duplicate rows in the dataset, based on specified criteria such as parcel ID, sale date, property address, sale price, and legal reference.

```sql

```


* Casting and Conversion: The queries use the CAST and CONVERT functions to change the data type of certain columns, such as converting the total deaths column from NVARCHAR to integer to enable aggregation calculations.

```sql

```

* Removing Unused Columns: The ALTER TABLE statement is used to drop unnecessary columns like owner address, tax district, and property address after the related data has been transformed and incorporated into other columns.

```sql

```


## Files
List and briefly describe the main files in your project. For example:
- `CovidVACSheet.xlsx`: File containing the raw and processed data files.
- `CovidDeathSheet.xlsx`: File containing the raw and processed data files.
