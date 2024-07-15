# Evaluación Final del Módulo 2

## Objetivo

El objetivo de esta evaluación es comprobar la comprensión y habilidades en SQL mediante la resolución de una serie de ejercicios prácticos. Utilizaremos la base de datos Sakila, una base de datos de ejemplo que simula una tienda de alquiler de películas, para realizar consultas y análisis de datos en el contexto de una tienda de alquiler de películas.

## Estructura

La base de datos Sakila incluye las siguientes tablas:

1. **actor**: Contiene información sobre los actores, incluyendo su identificador único, nombre, apellido y la fecha de la última actualización.
2. **address**: Almacena direcciones, incluyendo dirección, distrito, ciudad, código postal, teléfono y la fecha de la última actualización.
3. **category**: Contiene categorías de películas, con un identificador único, nombre y la fecha de la última actualización.
4. **city**: Incluye información sobre las ciudades, con un identificador único, nombre, país asociado y la fecha de la última actualización.
5. **country**: Almacena información sobre los países, con un identificador único, nombre y la fecha de la última actualización.
6. **customer**: Contiene información sobre los clientes, incluyendo su identificador único, nombre, apellido, correo electrónico, dirección, estado de actividad y la fecha de la última actualización.
7. **film**: Almacena información sobre las películas, incluyendo título, descripción, año de lanzamiento, idioma, duración del alquiler, tarifa de alquiler, duración, costo de reemplazo, clasificación y características especiales.
8. **film_actor**: Relaciona actores con películas, incluyendo los identificadores de actor y película, y la fecha de la última actualización.
9. **film_category**: Relaciona películas con categorías, incluyendo los identificadores de película y categoría, y la fecha de la última actualización.
10. **film_text**: Contiene el identificador único de las películas, su título y descripción.
11. **inventory**: Contiene información sobre el inventario, incluyendo identificadores de inventario, película y tienda, y la fecha de la última actualización.
12. **language**: Almacena idiomas, con un identificador único, nombre y la fecha de la última actualización.
13. **payment**: Contiene información sobre los pagos, incluyendo identificadores de pago, cliente, personal, alquiler, cantidad y fecha del pago.
14. **rental**: Almacena información sobre los alquileres, incluyendo identificadores de alquiler, fecha de alquiler, inventario asociado, cliente, fecha de devolución, personal y la fecha de la última actualización.
15. **staff**: Contiene información sobre el personal, incluyendo identificador único, nombre, apellido, dirección, imagen, correo electrónico, tienda asignada, estado de actividad, nombre de usuario, contraseña y la fecha de la última actualización.
16. **store**: Almacena información sobre las tiendas, incluyendo identificador único, personal de gestión, dirección y la fecha de la última actualización.

## Librerías

Para esta evaluación, no necesitas instalar librerías adicionales ya que todo se realiza en SQL. Sin embargo, es posible que necesites acceso a un cliente de base de datos SQL como MySQL Workbench, DBeaver, o cualquier otro que prefieras usar.