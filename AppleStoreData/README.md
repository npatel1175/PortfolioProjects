# Data Analysis Project: [Apple Store App Data]



## Table of Contents
- [Overview](#overview)
- [Dataset](#dataset)
- [Analysis](#analysis)
- [Results](#results)
- [Files](#files)


## Overview
The project focuses on analyzing a dataset of ​Apple Store apps to gain insights and make recommendations for app developers based on the findings. The data for the project was found on Kaggle. This analysis is great for an app developer trying to figure out what type of app they should create. 

## Tools Used
* SQL-Lite Online
* kaggle.com
* CSV file

## Dataset
The dataset used in the analysis is about apps available on the Apple Store. It contains information such as app names, sizes, ratings, supported devices, and languages. The dataset is sourced from kaggle.com and is in CSV file format. The data is analyzed using SQL queries with the help of SQL-Lite Online, an online tool for working with data. SQL-Lite Online allows you to upload files with a maxiumum size of 4 megabytes. Since the dataset is large, the csv file was split into four smaller files.

## Analysis
Since the files were uploaded, a table was created to combine the original four tables into one by using an UNION ALL statement. First thing I did was check the number of unique apps in both tables because this ensures we are dealing with the same set of application in the datasets. From this point forward I looked for the following:

* Check for an missing values in key fields
* Find out the number of apps per genre
* Get an overview of the app's ratings


## Results


Here are some of the key findings and insights I found from this dataset:

* Analysis shows that paid apps generally receives higher ratings compared to ones that are free. This could be for many reasons such as the engagement is higher considering that there is a financial factor involved. 
* Apps in ranging from 10-30 languages on average have a higher user rating compared to apps with less than 10 languages and apps with more than 30.
* When checking for the genres with low ratings, finance, catalogs, and navigation apps are some of the worst rated. This means the users are not satisfied and it might be a good opportunity for a developer to enter this space. 
* Applications with longer descriptions and more detailed explanations on the App Store have an average higher user rating.
* Some of the top rated apps for certain genres include Credit Karma for finance, TurboScan for business, Elevate for education and more. This could be a good insight for a stakeholder to check these apps as the top performing ones and ideally what they should try to emulate.
* On average all the apps have an average rating of 3.5 out of 5 stars. 
* The game and entertainment app industry has a very high number of apps suggesting that the market may be saturated.





## Files
List and briefly describe the main files in your project. For example:
- `appleStore_description1.csv`: File containing the raw and processed data files.
- `appleStore_description2.csv`: File containing the raw and processed data files.
- `appleStore_description3.csv`: File containing the raw and processed data files.
- `appleStore_description4.csv`: File containing the raw and processed data files.



