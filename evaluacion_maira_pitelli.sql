-- Evaluación Final Módulo 2

USE sakila;

-- 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados.
SELECT DISTINCT title AS titles
FROM film; 

-- 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".
SELECT title AS titles -- , rating (si quisiéramos visualizar también la clasificación)
FROM film
WHERE rating = 'PG-13';

-- 3. Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.
SELECT title, description
FROM film
WHERE description LIKE '%amazing%';

-- 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.
SELECT title -- , `length` (si quisiéramos visualizar también la duración)
FROM film
WHERE `length` > 120; -- Las tildes inversas se usan para evitar conflictos con palabras reservadas del SQL o para nombres de columnas que contienen caracteres especiales (como espacios por ejemplo).

-- 5. Recupera los nombres de todos los actores.
SELECT first_name AS names
FROM actor;

-- 6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.
SELECT first_name AS name, last_name AS surname
FROM actor
WHERE last_name LIKE '%Gibson%';
-- Uso el LIKE en lugar de last_name = 'Gibson' para asegurar que la consulta encontrará todos los actores cuyo apellido contenga "Gibson" en cualquier posición, lo que es útil para manejar apellidos compuestos o que incluyan "Gibson" como parte del apellido.

-- 7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.
SELECT first_name AS names -- , actor_id (si quisiéramos visualizar también el actor_id)
FROM actor
WHERE actor_id BETWEEN 10 AND 20;

-- 8. Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación.
SELECT title -- , rating (si quisiéramos visualizar también la clasificación)
FROM film
WHERE rating NOT IN ('R', 'PG-13');

-- 9. Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento.
SELECT COUNT(film_id) AS total_quantity, rating
FROM film
GROUP BY rating;

-- 10. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.
SELECT c.customer_id, c.first_name AS name, c.last_name AS surname, COUNT(r.rental_id) AS Total_FilmsRented
FROM rental AS r
INNER JOIN customer AS c
ON c.customer_id = r.customer_id -- USING(customer_id)
GROUP BY c.customer_id;

-- 11. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.
SELECT COUNT(r.rental_id) AS Total_FilmsRented, c.name AS CategoryName
FROM category AS c 
INNER JOIN film_category AS fc USING(category_id)
INNER JOIN inventory AS i USING(film_id)
INNER JOIN rental AS r USING(inventory_id)
GROUP BY c.name;

-- 12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.
SELECT round(AVG(`length`), 2) AS Average_duration, rating
FROM film
GROUP BY rating;

-- 13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".
SELECT a.first_name AS name, a.last_name AS surname
FROM actor AS a 
INNER JOIN film_actor AS fa USING(actor_id)
INNER JOIN film AS f USING(film_id)
WHERE f.title = "Indian Love";

-- 14. Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.
SELECT title, description 
FROM film
WHERE description LIKE '%dog%' 
   OR description LIKE '%cat%';

-- 15. Hay algún actor o actriz que no apareca en ninguna película en la tabla film_actor.
SELECT actor_id
FROM actor
WHERE actor_id NOT IN (SELECT DISTINCT actor_id FROM film_actor);

-- 16. Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.
SELECT title, release_year 
FROM film AS f 
WHERE release_year BETWEEN 2005 AND 2010;

-- 17. Encuentra el título de todas las películas que son de la misma categoría que "Family".
SELECT f.title -- , c.name
FROM film AS f 
LEFT JOIN film_category AS fc ON f.film_id = fc.film_id 
LEFT JOIN category AS c ON fc.category_id = c.category_id
WHERE c.name = 'Family';

-- 18. Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.
SELECT f.first_name, f.last_name
FROM (SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS total_quantity
	  FROM actor AS a 
	  INNER JOIN film_actor AS fa ON a.actor_id = fa.actor_id
	  GROUP BY a.actor_id, a.first_name, a.last_name) AS f
WHERE f.total_quantity > 10;

-- 19. Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla film.
SELECT title
FROM film 
WHERE rating = 'R' AND `length` > 120;

-- 20. Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y muestra el nombre de la categoría junto con el promedio de duración.
SELECT m.name, m.duration_mean
FROM (SELECT ROUND(AVG(f.`length`), 2) AS duration_mean, c.name 
	  FROM category AS c 
	  INNER JOIN film_category AS fc ON c.category_id = fc.category_id 
	  INNER JOIN film AS f ON fc.film_id = f.film_id 
	  GROUP BY c.category_id, c.name) AS m
WHERE m.duration_mean > 120;

-- 21. Encuentra los actores que han actuado en al menos 5 películas y muestra el nombre del actor junto con la cantidad de películas en las que han actuado.
SELECT f.first_name, f.total_quantity
FROM (SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS total_quantity
	  FROM actor AS a 
	  INNER JOIN film_actor AS fa ON a.actor_id = fa.actor_id
	  GROUP BY a.actor_id, a.first_name, a.last_name) AS f
WHERE f.total_quantity >= 5
ORDER BY f.total_quantity;

-- 22. Encuentra el título de todas las películas que fueron alquiladas por más de 5 días. Utiliza una subconsulta para encontrar los rental_ids con una duración superior a 5 días y luego selecciona las películas correspondientes.
SELECT DISTINCT f.title
FROM film AS f 
LEFT JOIN inventory AS i ON f.film_id = i.film_id 
LEFT JOIN rental AS r ON i.inventory_id = r.inventory_id 
WHERE r.rental_id IN (SELECT rental_id 
 					  FROM rental AS r 
					  WHERE DAY(return_date) - DAY(rental_date) > 5);

-- 23. Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría "Horror". Utiliza una subconsulta para encontrar los actores que han actuado en películas de la categoría "Horror" y luego exclúyelos de la lista de actores.
SELECT ac.first_name, ac.last_name
FROM actor AS ac
WHERE actor_id NOT IN (SELECT DISTINCT a.actor_id 
					   FROM actor AS a 
					   INNER JOIN film_actor AS fa ON a.actor_id = fa.actor_id
					   INNER JOIN film_category AS fc ON fa.film_id = fc.film_id
					   INNER JOIN category AS c ON fc.category_id = c.category_id
					   WHERE c.name = 'Horror');
					 
-- 24. BONUS: Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla film.
SELECT f.title -- , c.name, f.`length`
FROM film AS f
INNER JOIN film_category AS fc ON f.film_id = fc.film_id 
INNER JOIN category AS c ON fc.category_id = c.category_id 
WHERE c.name = 'Comedy' AND f.`length` > 180;

-- 25. BONUS: Encuentra todos los actores que han actuado juntos en al menos una película. La consulta debe mostrar el nombre y apellido de los actores y el número de películas en las que han actuado juntos.

-- Paso 1: Creación de una doble tabla usando film_actor
-- Hacemos un self-join de la tabla film_actor con ella misma para tener acceso a las parejas de actores que han actuado en las mismas películas.
SELECT * 
FROM film_actor AS fa1
JOIN film_actor AS fa2 ON fa1.film_id = fa2.film_id

-- Paso 2: Seleccionamos las parejas de actores desde las distintas tablas y creamos una columna nueva, movies_together, que devuelve el recuento de películas en las que la pareja de actores ha trabajado.
-- La condición en el WHERE asegura que el id del actor1 será siempre menor que el id del actor2, para evitar comparar un actor consigo mismo y evitar duplicados.
-- Agrupamos por actor1_id y actor2_id, siguiendo la buena práctica en SQL de agrupar por las columnas que no se utilizan en funciones de agregación.
-- Finalmente, añadimos un HAVING para cumplir con el requisito de encontrar actores que han actuado juntos en al menos una película.
SELECT fa1.actor_id AS actor1, fa2.actor_id AS actor2, COUNT(fa1.film_id) AS movies_together
FROM film_actor AS fa1
JOIN film_actor AS fa2 ON fa1.film_id = fa2.film_id
WHERE fa1.actor_id < fa2.actor_id
GROUP BY fa1.actor_id, fa2.actor_id
HAVING COUNT(fa1.film_id) > 0

-- Paso 3: Usamos el resultado de la consulta anterior para crear una CTE llamada actor_pairs:
WITH actor_pairs AS (SELECT fa1.actor_id AS actor1, fa2.actor_id AS actor2, COUNT(fa1.film_id) AS movies_together
					 FROM film_actor AS fa1
					 JOIN film_actor AS fa2 ON fa1.film_id = fa2.film_id
					 WHERE fa1.actor_id < fa2.actor_id
					 GROUP BY fa1.actor_id, fa2.actor_id
					 HAVING COUNT(fa1.film_id) > 0)
					 
-- Paso 4: Creamos la consulta final, usando la CTE
-- Para seleccionar el nombre completo del actor1 y el nombre completo del actor2 es necesario hacer un doble join con la tabla actor, 
-- donde en uno de los joins la unión se hace por la columna actor1_id de la CTE y en el otro por la columna actor2_id, que representan los ids de la pareja de actores.
-- Finalmente añadimos el recuento de las parejas ap.movies_together en el select y ordenamos el resultado final por la columna movies_together en orden descendente.				 
SELECT a1.first_name AS A1_name, a1.last_name AS A1_surname,
       a2.first_name AS A2_name, a2.last_name AS A2_surname,
       ap.movies_together
FROM actor_pairs AS ap
JOIN actor AS a1 ON ap.actor1 = a1.actor_id
JOIN actor AS a2 ON ap.actor2 = a2.actor_id
ORDER BY ap.movies_together DESC;