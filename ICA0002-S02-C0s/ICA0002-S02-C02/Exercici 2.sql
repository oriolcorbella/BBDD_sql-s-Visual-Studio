
c. Muestra el número de partidos jugados por equipo como lucal de los 3 equipos que hayan jugado más

    SELECT Equip_Local, COUNT(*) AS Num_Partidos FROM Partit GROUP BY Equip_Local ORDER BY Num_Partidos DESC LIMIT 3;

d. Muestra la suma de presupuestos de todos los equipos

    SELECT SUM(Pressupost) AS Suma_Presupuestos FROM Equip;

e. Muestra el nombre y apellido de los jugadores ordenados por el apellido de forma ascendente y por el nombre de forma descendente

    SELECT P.Nom, P.Cognom1 FROM Persona P JOIN Jugador J ON P.Num_SS = J.Num_SS_Jugador ORDER BY P.Cognom1 ASC, P.Nom DESC;

f. Muestra equipos listados de la A a la Z filtrando solo los 3 primeros resultados

    SELECT Nom_Equip FROM Equip ORDER BY Nom_Equip ASC LIMIT 3;



