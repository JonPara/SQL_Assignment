USE sakila;

-- QUESTION 1A
SELECT first_name, last_name FROM actor;

-- QUESTION 1B
SELECT CONCAT(first_name, " ", last_name) AS 'Actor Name'
FROM actor;

-- QUESTION 2A
SELECT * FROM actor
WHERE first_name = "JOE";

-- QUESTION 2B
SELECT * FROM actor
WHERE last_name LIKE '%GEN%';

-- QUESTION 2C
SELECT last_name, first_name FROM actor
WHERE last_name LIKE '%LI%';

-- QUESTION 2D
SELECT * FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

-- QUESTION 3A
ALTER TABLE actor
ADD middle_name VARCHAR(100);

-- QUESTION 3B
ALTER TABLE actor MODIFY middle_name VARCHAR(100) AFTER first_name;
ALTER TABLE actor MODIFY middle_name BLOB;

-- QUESTION 3D
ALTER TABLE actor DROP middle_name;

SELECT * FROM actor;

-- QUESTION 4A
SELECT last_name, COUNT(last_name) FROM actor
GROUP BY last_name;

-- QUESTION 4B
SELECT last_name, first_name, COUNT(last_name) as last_name_count FROM actor
GROUP BY last_name
HAVING last_name_count >= 2;

SELECT * FROM actor;

-- QUESTION 4C
SELECT first_name, last_name FROM actor
WHERE first_name = 'GROUCHO' AND last_name = 'WILLIAMS';

-- QUESTION 4D
UPDATE actor
SET first_name = 'HARPO'
WHERE first_name = 'GROUCHO' AND last_name = 'WILLIAMS';

SELECT first_name, last_name FROM actor
WHERE first_name = 'HARPO' AND last_name = 'WILLIAMS';

UPDATE actor
SET first_name = 'MUCHO GROUCHO'
WHERE first_name = 'HARPO' AND last_name = 'WILLIAMS';

SELECT * FROM actor;

-- QUESTION 5A
SHOW CREATE TABLE address;

-- QUESTION 6A

SELECT first_name, last_name, address.address FROM staff
INNER JOIN address ON staff.address_id = address.address_id;

-- QUESTION 6B (Incorrect, difficulty finishing 'joins' questions)

SELECT staff_id, first_name, last_name, SUM(payment.amount) FROM staff
JOIN payment ON staff.staff_id = payment.staff_id
WHERE payment_date LIKE '2005%'
GROUP BY staff_id;

SELECT staff_id, SUM(amount) FROM payment
GROUP BY staff_id;


-- QUESTION 6C (Unsure if this is correct)

SELECT film.title AS 'Title', film_actor.actor_id AS 'Number of Actors' FROM film
INNER JOIN film_actor
ON film.film_id = film_actor.film_id
GROUP BY title;


-- QUESTION 6D

SELECT film.title AS 'Title', COUNT(inventory.film_id) as 'Total Copies'  FROM film
INNER JOIN inventory ON film.film_id = inventory.film_id
WHERE title = 'HUNCHBACK IMPOSSIBLE';

-- QUESTION 6E

SELECT customer.first_name, customer.last_name, SUM(payment.amount) AS 'Total Paid' FROM customer
INNER JOIN payment 
ON customer.customer_id = payment.customer_id
GROUP BY customer.last_name
ORDER BY customer.last_name;

-- QUESTION 7A
SELECT title FROM film
WHERE title LIKE 'K%' OR title LIKE 'Q%' AND language_id = 1;

-- QUESTION 7B
SELECT first_name, last_name 
FROM actor
WHERE actor_id IN 

			(SELECT actor_id FROM film_actor 
			WHERE film_id IN
            
				(SELECT film_id FROM film
				WHERE title = 'ALONE TRIP'));
                
		
-- QUESTION 7C

SELECT city.city_id, city.country_id;
                
                
SELECT * FROM address;
SELECT * FROM city;
SELECT * FROM customer;
SELECT * FROM country;


-- QUESTION 7D (Difficulty Completing This Questions)
SELECT category_id, name FROM category
WHERE name = 'Family';

SELECT film_id FROM film_category
WHERE category_id = 8;


SELECT film_id FROM film_category;
WHERE film_id IN 
            (SELECT film_id FROM film_category
			WHERE name = 'Family');

SELECT * FROM film_category, film
WHERE category_id IN 
					(SELECT category_id FROM category 
					WHERE name = 'Family');


-- QUESTION 7E

SELECT title, rental_duration FROM film
GROUP BY title ORDER BY rental_duration;

-- QUESTION 7F (Most likely not correct)

SELECT store.store_id, SUM(payment.amount) AS 'Total Sales' FROM store
INNER JOIN payment
GROUP BY store_id;


-- QUESTION 7G (Incorrect, unsure how to debug)

SELECT st.store_id, city.city, country.country FROM store st
JOIN country
JOIN store
JOIN city ON country.country_id = city.country_id
GROUP BY city;

-- QUESTION 7H

SELECT category.name, 











