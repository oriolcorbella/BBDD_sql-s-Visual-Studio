1. SELECT id_temporada FROM Temporada WHERE fecha_inicio BETWEEN 2010 AND 2015;

2. SELECT id_temporada FROM Temporada WHERE fecha_fin IS NULL;

3. SELECT nombre_competicion FROM Competicion WHERE nombre_TV > 5;

4. SELECT nombre_competicion FROM Competicion WHERE nombre_TV LIKE 'SKY%';

5. SELECT DISTINCT ciudad FROM Equipo;

6. SELECT E.nombre_equipo, E.ciudad FROM Clasificacion C JOIN Equipo E ON C.nombre_equipo = E.nombre_equipo WHERE C.nombre_competicion = 'La Liga' AND C.id_temporada = 3 AND C.posicion = 1;

7. SELECT nombre_equipo FROM Equipo WHERE ciudad IN ('Madrid', 'Barcelona', 'Sevilla');

8. SELECT C.nombre_equipo FROM Clasificacion C WHERE C.nombre_competicion = 'Champions' AND C.id_temporada = 5 AND C.posicion <= 3;
