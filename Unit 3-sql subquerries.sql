USE sakila;
SELECT film.film_id, film.title
COUNT(inventory.film_id) AS copies
FROM inventory 
JOIN film ON inventory.film_id = film.film_id
WHERE film.title = "Hunchback Impossible"
GROUP BY inventory.film_id;

SELECT actor_id, CONCAT_WS(" ", `first_name`, `last_name`) AS Full_Name
FROM actor
WHERE actor_id IN (
    SELECT actor_id
    FROM film_actor
    WHERE film_id = (
        SELECT film_id
        FROM film
        WHERE title = 'Alone Trip'
    )
);

               4. 
              SELECT film_id, title
FROM film
WHERE film_id IN (
    SELECT film_id
    FROM film_category
    WHERE category_id = (
        SELECT category_id
        FROM category
        WHERE name = 'family'
    )
);
5.
SELECT name, email 
FROM customers 
WHERE customer_id IN (SELECT customer_id FROM customer_details WHERE country = 'Canada');
SELECT c.name, c.email 
FROM customers c 
JOIN customer_details cd ON c.customer_id = cd.customer_id 
WHERE cd.country = 'Canada';
6:
SELECT actor_id, COUNT(film_id) AS film_count
FROM film_actor
GROUP BY actor_id
ORDER BY film_count DESC
LIMIT 1;
SELECT f.title
FROM film_actor fa
JOIN film f ON fa.film_id = f.film_id
WHERE fa.actor_id = 1;
7.
