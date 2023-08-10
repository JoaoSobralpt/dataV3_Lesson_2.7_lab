USE sakila;
-- 1 How many films are there for each of the categories in the category table. Use appropriate join to write this query.

SELECT c.name,  COUNT(f.film_id) AS film_count
FROM sakila.category c
JOIN sakila.film_category f 
USING (category_id)
GROUP BY c.category_id, c.name
ORDER BY film_count DESC;

-- 2 Display the total amount rung up by each staff member in August of 2005.
SELECT SUM(p.amount), s.staff_id
FROM sakila.payment p
JOIN sakila.staff S
USING (staff_id)
WHERE p.payment_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY s.staff_id
ORDER BY SUM(p.amount) DESC;
 
-- 3 Which actor has appeared in the most films?
SELECT first_name, last_name, a.actor_id, COUNT(f.film_id)
FROM sakila.actor a
JOIN sakila.film_actor f
USING (actor_id)
GROUP BY a.actor_id
ORDER BY COUNT(f.film_id) DESC
LIMIT 1;
-- 4 Most active customer (the customer that has rented the most number of films)
SELECT c.first_name, c.last_name, COUNT(r.customer_id)
FROM sakila.customer c
JOIN sakila.rental r
USING (customer_id)
GROUP BY customer_id
ORDER BY COUNT(r.customer_id) DESC
LIMIT 1;
-- 5 Display the first and last names, as well as the address, of each staff member.
SELECT s.first_name, s.last_name, a.address
FROM sakila.staff s
JOIN sakila.address a
USING (address_id);

-- 6 List each film and the number of actors who are listed for that film.
SELECT f.film_id, f.title, COUNT(fa.actor_id)
FROM sakila.film f
JOIN sakila.film_actor fa
USING(film_id)
GROUP BY f.film_id
ORDER BY COUNT(actor_id) DESC;

-- 7 Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name.
SELECT SUM(p.amount), p.customer_id, c.first_name, c.last_name
FROM sakila.payment p
JOIN sakila.customer c
USING (customer_id)
GROUP BY p.customer_id
ORDER BY C.last_name ASC;

-- 8 List the titles of films per category.
SELECT f.title, fc.category_id, c.name
FROM sakila.film f
JOIN sakila.film_category fc
USING (film_id)
JOIN sakila.category c
USING (category_id);