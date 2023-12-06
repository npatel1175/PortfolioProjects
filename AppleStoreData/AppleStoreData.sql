CREATE TABLE appleStore_description_combined AS

SELECT * FROM appleStore_description1

UNION ALL

SELECT * FROM appleStore_description2

UNION ALL

SELECT * FROM appleStore_description3

UNION ALL

SELECT * FROM appleStore_description4


**EXPLORATORY DATA ANALYSIS**

--check the number of unique apps is both tableApplestore

SELECT COUNT(DISTINCT id) as UniqueAppIDs
from AppleStore


SELECT COUNT(DISTINCT id) as UniqueAppIDs
from appleStore_description_combined

--Check for an missing values in key fields--

select count(*) as MissingValues
FROM AppleStore
Where track_name IS null or user_rating is null or prime_genre is NULL


select count(*) as MissingValues
FROM appleStore_description_combined
Where app_desc is null

--Find out the number of apps per genre

SELECT prime_genre, Count(*) as NumApps
From AppleStore
Group by prime_genre
order by NumApps DESC

--Get an overview of the app's ratings--

SELECT min(user_rating) as MinRating, 
	   max(user_rating) AS MaxRating,
       avg(user_rating) AS AvgRating
FROM AppleStore

GROUP BY PriceBinStart
order by PriceBinStart

**DATA ANALYSIS**

--Determine whether paid apps havge higher ratings than free apps--


SELECT CASE
			when price > 0 then 'Paid'
            Else 'Free'
       end as App_Type,
       avg(user_rating) as Avg_Rating
FROM AppleStore
group by App_Type


--check if apps with more supported languages have higher ratings--

SELECT CASE
			when lang_num <10 then '<10 languages'
            when lang_num BETWEEN 10 and 30 then '10-30 languages'
            else '>30 languages'
       end as language_bucket,
       avg(user_rating) as Avg_Rating
FROM AppleStore
GROUP by language_bucket
order by Avg_Rating DESC


-- Check genres with low ratings--

select prime_genre,
	   avg(user_rating) As Avg_Rating
from AppleStore
group by prime_genre
order by Avg_Rating ASC
limit 10

--Check if there is correlation between the length of the app description and the user rating--

SELECT CASE
			When length(b.app_desc) <500 then 'Short'
            When length(b.app_desc) between 500 and 1000 then 'Medium'
            ElSE 'Long'
       END AS description_length_bucket,
       avg(a.user_rating) As average_rating
       
FROM
	AppleStore as a 
JOIN
	appleStore_description_combined AS b 
on 
	a.id = b.id

group by description_length_bucket
order by average_rating desc
 

--check the top-rated apps for each genre--

SELECT
	prime_genre,
    track_name,
    user_rating
FROM (
  			SELECT
  			prime_genre,
  			track_name,
  			user_rating,
  			RANK() OVER(PARTITION by prime_genre order by user_rating desc, rating_count_tot DESC) as rank 
            FROM
            AppleStore
     ) as a 
  WHERE
  a.rank = 1







