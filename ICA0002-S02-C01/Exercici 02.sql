1. SELECT nombre, apellido1, apellido2 FROM Arbitros;

2. SELECT nombre_equipo FROM Equipos WHERE ano_fundacion < 1950 AND entrenador IS NOT NULL;

3. SELECT nombre, apellido FROM Jugadores WHERE (dorsal = 1 AND ubicacion = 'Portero') OR (dorsal = 9 AND ubicacion = 'Delantero');

4. SELECT CONCAT(nombre, ' ', apellido, ' ', apellido2) AS nombre_completo FROM Personas WHERE nombre LIKE '%c%';

5. SELECT * FROM Partidos WHERE fecha = 2;

6. SELECT * FROM Partidos WHERE fecha = CURDATE();

7. SELECT nombre, apellido FROM Arbitros WHERE fecha_inicio BETWEEN 2000 AND 2005 AND profesion = 'Técnico Informático';

8. SELECT nombre_equipo, presupuesto - 100000 AS presupuesto_reducido FROM 