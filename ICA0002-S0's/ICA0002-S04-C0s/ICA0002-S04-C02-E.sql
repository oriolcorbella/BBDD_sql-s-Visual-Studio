-- a)  Selecciona el nombre del equipo y su ciudad que ha quedado en 1º lugar 
--     en la competición ‘La Liga’ en la temporada con identificador 3.
SELECT 
    Equipo.nombre_equipo,
    Equipo.ciudad
FROM 
    Clasificacion
INNER JOIN 
    Equipo 
    ON Clasificacion.nombre_equipo = Equipo.nombre_equipo
WHERE 
    Clasificacion.posicion = 1
    AND Clasificacion.nombre_competicion = 'La Liga'
    AND Clasificacion.id_temporada = 3;


-- b) Muestra los equipos que han quedado entre los tres primeros clasificados en 
--    la competición ‘Champions’ en la temporada con id 5.
SELECT 
    Equipo.nombre_equipo,
    Clasificacion.posicion
FROM 
    Clasificacion
INNER JOIN 
    Equipo 
    ON Clasificacion.nombre_equipo = Equipo.nombre_equipo
WHERE 
    Clasificacion.posicion <= 3
    AND Clasificacion.nombre_competicion = 'Champions'
    AND Clasificacion.id_temporada = 5;


-- c) Muestra en nombre de los equipos junto con el nombre de sus federaciones, 
--    aunque alguno de ellos no tenga federación.
SELECT 
    Equipo.nombre_equipo,
    Federacion.nombre_federacion
FROM 
    Equipo
LEFT JOIN 
    Federacion 
    ON Equipo.nombre_federacion = Federacion.nombre_federacion;


-- d) Muestra en nombre de los equipos junto con el nombre de sus federaciones,
--    aunque alguno de ellos no tenga federación, así como también las federaciones
--    sin equipos
SELECT 
    Equipo.nombre_equipo,
    Federacion.nombre_federacion
FROM 
    Equipo
LEFT JOIN 
    Federacion 
    ON Equipo.nombre_federacion = Federacion.nombre_federacion

UNION

SELECT 
    Equipo.nombre_equipo,
    Federacion.nombre_federacion
FROM 
    Federacion
LEFT JOIN 
    Equipo 
    ON Federacion.nombre_federacion = Equipo.nombre_federacion;

-- a.2)	Selecciona las entregas con más de dos regalos.
SELECT e.id_entrega, COUNT(r.id_regalo) AS numero_regalos 
FROM Entrega e INNER JOIN Regalo r 
ON e.id_entrega = r.id_entrega GROUP BY e.id_entrega 
HAVING COUNT(r.id_regalo) > 2

-- b.2) Selecciona las colecciones donde el peso total de sus regalos sea superior a 5000g.
SELECT c.id_coleccion SUM(r.peso) AS peso_total FROM Coleccion c
WHERE c.id_coleccion

-- c.2) Selecciona los usuarios que son suscriptores asociados:
SELECT u.id_usuario, u.nombre FROM Usuario u 
INNER JOIN Subscriptor s ON u.id_usuario = s.id_usuario;

-- d.2) Selecciona los usuarios, que son clientes a los que no les gusta el formato electrónico.
SELECT u.id_usuario, u.nombre FROM Usuario u 
INNER JOIN Cliente c ON u.id_usuario = c.id_usuario WHERE c.formato_preferido != 'electrónico';

