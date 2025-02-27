#################################################################################################
					EXERCICIS BBDD NORTHWIND
#################################################################################################

--1. Busca quines son els territoris dels empleats que han estudiat psicologia 
SELECT * FROM Employees WHERE notes LIKE "%psychology%"
--2. Busca els productes de preu inferior a 15 i que pertanyen a la categoria que té el màxim de productes
SELECT * FROM Products WHERE UnitPrice < 15 
AND CategoryID = (
    SELECT CategoryID
    FROM Products
    GROUP BY CategoryID
    ORDER BY COUNT(*) DESC
    LIMIT 1
)
--3. Conta quantes ordres diferents existeixen sobre productes amb el màxim de descompte
SELECT COUNT(DISTINCT OrderID) 
FROM OrderDetails
WHERE Discount = (SELECT MAX(Discount) FROM OrderDetails);

--4. Dona el nom dels productes que pertanyen a la categoria del qual el promig del preu dels seus productes és superior a 50
SELECT ProductName FROM Products WHERE CategoryID IN (
    SELECT DISTINCT CategoryID
    FROM Products
    WHERE UnitPrice > 50
);
--5. Per tal d'identificar els productes que no s'estan venent gaire i comparar-los amb els que si que s'estan venent, necessitem un llistat amb
--l'informació dels productes dels quals se n'han venut menys de 100 unitats i també dels que se n'han venut més de 1000.
SELECT P.ProductName, OD.Quantitat_de_Vendes
FROM (
    SELECT ProductID, SUM(Quantity) AS Quantitat_de_Vendes
    FROM OrderDetails
    GROUP BY ProductID
    HAVING SUM(Quantity) < 100 OR SUM(Quantity) > 1000
) AS OD
JOIN Products AS P ON OD.ProductID = P.ProductID;

--6. Volem saber els treballadors que han generat més orders que el treballador número 7.
SELECT 
--7. Retorna el nom de l'empleat que ha fet mes orders de tots. (usar subconsulta en el having amb un >= ALL)

--8. Volem saber si s'han servit mes orders amb el shipper "Speedy Express" que amb el shipper "Federal Shipping".

--9- Busca els productes de preu inferior a 15 i que pertanyen a la categoria que té el màxim de productes.

--10- Conta quantes ordres diferents existeixen sobre productes amb el màxim de descompte.

--11- Dona el nom dels productes que pertanyen a la categoria del qual el promig del preu dels seus productes és superior a 50.

--12- Retorna el nom de l'empleat que ha fet més orders de tots.