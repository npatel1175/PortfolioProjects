# Ultramarathon Exploratory Data Analysis (EDA) Project

## Table of Contents
- [Overview](#overview)
- [Dataset](#dataset)
- [Notebooks](#notebooks)
- [Findings](#findings)
- [Dependencies](#dependencies)

## Overview

The project focuses on analyzing a dataset on ultra-marathon races. The data for the project was found on the Kaggle website. This analysis is great for an people in the research and/or medical field. 
Data analysis is crucial in ultramarathons for optimizing athlete performance, aiding in injury prevention, and enhancing overall race experiences. Athletes can leverage training and race data to refine their strategies, pacing, and nutrition, contributing to improved performance and reduced injury risks. Additionally, data-driven insights inform optimal pacing strategies, nutritional planning, and recovery protocols, ensuring that athletes are well-prepared for the unique challenges of ultramarathon distances. Beyond individual benefits, data analysis also plays a pivotal role in event planning and management, informing organizers about participant demographics, satisfaction levels, and overall trends for future race optimization.

## Tools Used
* Jupyter Notebooks
* Kaggle
* CSV File

## Dataset
The dataset was found on Kaggle as a huge collection of over 7 million race records registered between 1798 and 2022. The dataset is in a ​tabular format with 13 ​columns, including information like race day, distance, average speed, and athlete ID.

Before the analysis, some preprocessing steps were performed. This included cleaning up the data, as there were some columns with mixed data types and inconsistencies. The data types were checked using the "d-types" function, and any discrepancies were addressed. Additionally, the column names were rearranged in a desired order using the "pre-order columns" function.

## Notebooks
List and briefly describe the main Jupyter Notebooks in your project. For example:
- `Ultra_Marathon_EDA.ipynb`: Notebook containing initial data exploration using Pandas.
- `Ultra_Marathon_EDA.ipynb`: Notebook focusing on data visualization using Seaborn.


## Findings
Key Findings from EDA:

* The dataset focuses on ultra marathons, specifically 50k and 50 mile races.
* There are more 50k races than 50 mile races in the dataset.
* Male runners tend to have slightly faster average speeds than female runners in both 50k and 50 mile races.
* The fastest age group in the 50 mile race is 29, followed by 23 and 28.
* Older age groups (60s and 70s) also participate in and complete 50 mile races.
* Athletes generally run slightly slower in the summer season compared to other seasons.

Important Patterns and Trends:

* The distribution of race lengths shows that 50k races are more common than 50 mile races.
* Male runners tend to dominate the 50 mile race category, while the gender distribution is more even in the 50k race category.
* The fastest runners in the 50 mile race tend to be in their late 20s or early 30s.
* Older age groups, including runners in their 60s and 70s, participate and complete 50 mile races.
* The average speed of runners in the summer season is slightly slower compared to other seasons.

## Dependencies
The main Python libraries and dependencies used in the project:
- pandas
- seaborn

```python
#importing the libraries
import pandas as pd
import seaborn as sns
``````