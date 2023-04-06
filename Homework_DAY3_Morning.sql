USE sakila;


-- 1 Select all the actors with the first name ‘Scarlett’.
SELECT * FROM sakila.actor
WHERE (first_name='Scarlett');

-- 2 How many physical copies of movies are available for rent in the store's inventory? How many unique movie titles are available?
SELECT COUNT(inventory_id) AS ph_cop, COUNT(distinct(inventory_id)) AS titles from sakila.inventory;

-- 3 What are the shortest and longest movie duration? Name the values max_duration and min_duration.

SELECT max(length) AS max_duration FROM sakila.film;
SELECT min(length) AS min_duration FROM sakila.film;

-- 4 What's the average movie duration expressed in format (hours, minutes)?
SELECT CONCAT(floor(AVG(length)/60),'h ' ,avg(length)%60,'m') as average_length FROM sakila.film;

-- 5 How many distinct (different) actors' last names are there?
SELECT COUNT(distinct(last_name)) FROM sakila.actor;

-- 6 How many days was the company operating? Assume the last rental date was their closing date. (check DATEDIFF() function). 
SELECT DATEDIFF(max(rental_date),min(rental_date)) FROM sakila.rental; 

 -- 7 Show rental info with additional columns month and weekday. Get 20 results.
 Select*, MONTH(rental_date) AS month, WEEKDAY(rental_date) as DayofWeek FROM rental
 LIMIT 20;
 
 -- 8 Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
 SELECT*, 
 CASE
 WHEN DayofWEEK (rental_date) IN (1,2,3,4,5) then 'workday'
 WHEN DayofWeek (rental_date) IN (6,7) then 'weekend'
 ELSE 'No status'
 END AS 'Typeday'
 FROM rental;
 -- 

-- 9 Get release years.
SELECT DISTINCT release_year FROM sakila.film;

-- 10 Get all films with ARMAGEDDON in the title.

SELECT * FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%';

-- 11 Get all films which title ends with APOLLO.
SELECT * FROM sakila.film
WHERE title LIKE '%APOLLO';

-- 12 Get 10 the longest films.
SELECT * FROM film
ORDER BY length DESC
LIMIT 10;

-- 13 How many films include Behind the Scenes content?
SELECT * FROM film
WHERE special_features LIKE ('%Behind the Scenes%');

-- NOT SURE IF THE PREVIOUS OR THE FOLLOWING SOLUTIONS SO I AM ADDING BOTH

SELECT * FROM film
WHERE special_features IN ('Behind the Scenes');


