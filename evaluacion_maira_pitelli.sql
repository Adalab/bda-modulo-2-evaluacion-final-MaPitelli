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

