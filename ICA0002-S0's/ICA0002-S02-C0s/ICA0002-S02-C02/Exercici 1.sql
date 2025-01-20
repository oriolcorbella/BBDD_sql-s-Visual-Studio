a. Selecciona el nombre de los equipos que han ganado alguna vez una competición (evitando repetidos) siempre que hayan ganado más de 5 veces.

    SELECT nombre_equipo FROM Clasificacion WHERE posicion = 1 GROUP BY nombre_equipo HAVING COUNT(nombre_equipo) > 5;

b. Muestra el nombre del décimo equipo ordenado de la A a la Z.

    SELECT nombre_equipo FROM Equipo ORDER BY nombre_equipo ASC LIMIT 9,1;

c. Muestra el número de equipos que hay en la base de datos.

    SELECT COUNT(nombre_equipo) AS numero_equipos FROM Equipo;

d. Muestra el número de equipos por competición y temporada.

    SELECT COUNT (nombre_equipo) AS numero_equipos, nombre_competicion, id_temporada FROM Clasificacion GROUP BY nombre_competicion, id_temporada;

e. Muestra cuántos equipos hay en cada competición de la temporada 1.

    SELECT COUNT (nombre_equipo) AS nombre_competicion FROM Clasificacion WHERE id_temporada = 1 GROUP BY nombre_competicion;


