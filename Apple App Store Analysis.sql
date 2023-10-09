CREATE TABLE appleStore_description_combined AS

SELECT * FROM appleStore_description1
UNION ALL
SELECT * FROM appleStore_description2
UNION ALL
SELECT * FROM appleStore_description3
UNION ALL
SELECT * FROM appleStore_description4


**EXPLORATORY DATA ANALYSIS**

--check the number of unique apps in both tables

SELECT COUNT(DISTINCT id) AS UniqueAppIDs
FROM AppleStore

SELECT COUNT(DISTINCT id) AS UniqueAppIDs
FROM appleStore_description_combined


--check for missing values in key fields 

SELECT COUNT(*) AS MissingValues
FROM AppleStore
WHERE track_name IS NULL OR user_rating IS NULL OR prime_genre IS NULL

SELECT COUNT(*) AS MissingValues
FROM appleStore_description_combined
WHERE app_desc IS NULL


--Find the number of apps per genre

SELECt prime_genre, count(*) AS numApps
FROM AppleStore
GROUP BY prime_genre
ORDER BY numApps DESC


--Get an overview of the apps ratings 

SELECT min(user_rating) AS minRating,
       max(user_rating) AS maxRating,
       avg(user_rating) AS avgRating
FROM AppleStore
       


***DATA ANALYSIS***

--Determine whether paid apps have higher ratings 

SELECT CASE
			WHEN price > 0 THEN 'Paid'
            ELSE 'Free'
       END AS appType,
avg(user_rating) AS avgUsrRating
FROM AppleStore
GROUP By appType

--Check if multilinngual apps have higher ratings

SELECT CASE
			WHEN lang_num < 10 THEN 'Under 10 languages'
            WHEN lang_num BETWEEN 10 AND 30 THEN '10-30 languages'
            ELSE 'Over 30 languages'
       END AS langBucket,
avg(user_rating) AS avgUsrRating
FROM AppleStore
GROUP BY langBucket
ORDER By avgUsrRating DESC


--Check genres with low ratings

SELECT prime_genre AS genre, 
	   avg(user_rating) AS avgRating
FROM AppleStore
GROUP BY genre
ORDER BY avgRating ASC


--Check if there is a correlation between the length of the app description on user rating

SELECT 
		CASE
			WHEN length(b.app_desc) < 500 THEN 'Short Description'
            WHEN length(b.app_desc) BETWEEN 500 AND 1000 THEN 'Medium Length Description'
            ELSE 'Long Length Description'
        END AS descLengthBucket,
        avg(user_rating) AS avgRating

FROM
	AppleStore AS a
JOIN
	appleStore_description_combined AS b
ON
	a.id = b.id

GROUP BY descLengthBucket
ORDER BY avgRating DESC


--Check the top-rated apps for each genre (using window funtions)

SELECT prime_genre, track_name, user_rating,
FROM (
      SELECT prime_genre, track_name, user_rating,
      RANK() OVER(PARTITION BY prime_genre ORDER BY user_rating DESC, rating_count_tot DESC) AS rank
      FROM AppleStore
     ) AS a
WHERE a.rank = 1


/***OBSERVATIONS & RECOMMENDATIONS***

1. Paid vs Free Apps
	My analysis shows that paid apps have better reviews than free apps.
    This could be due to increaded engagement or a perception of value towards paid apps.
    
2. Language Support
	Apps supporting languages between 10 and 30 seems to have higher ratings.
    Targeting the right languages instead of adding all possible languages seems to be the best option.
    
3. Low Rated Apps
	FINANCE and BOOK apps have lower ratings overall.
    These apps could be failing to meet user needs or are of sub par quality.
   
4. Description Length
	The length of the description seems to have a positive corelation with the ratings.
    Perhaps the users require a good understanding of the features and capabilities of the app before downloading.
    This could help developers set epectations and avaoid low ratings from users.
 
5. High Competition Genres
	GAMES and ENTERTAINMENT have the highest amount of rating and hence have a higher level of competition