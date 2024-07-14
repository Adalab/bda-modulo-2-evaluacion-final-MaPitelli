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

