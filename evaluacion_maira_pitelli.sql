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

