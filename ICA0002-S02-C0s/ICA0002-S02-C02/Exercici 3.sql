a. Selecciona la id de los suscriptores que han comprado alguna entrega como clientes

    SELECT DISTINCT S.id_Subscriptor FROM Subscriptor S JOIN Client_Entrega CE ON S.id_Subscriptor = CE.id_Client;

b. Selecciona el nombre de las colecciones junto con el número de entregas de cada una de ellas

    SELECT E.Nom_Coleccio, COUNT(*) AS Num_EntregasFROM Entrega E GROUP BY E.Nom_Coleccio;

c. Selecciona las entregas con más de dos regalos

    SELECT R.Data_Entrega, R.Nom_Coleccio FROM Regal R GROUP BY R.Data_Entrega, R.Nom_Coleccio HAVING COUNT(R.id_Regal) > 2;

d. Selecciona las colecciones donde el peso total de sus regalos sea superior a 5000g

    SELECT E.Nom_Coleccio, SUM(R.Pes) AS Peso_Total FROM Regal R JOIN Entrega E ON R.Data_Entrega = E.Data_Entrega AND R.Nom_Coleccio = E.Nom_Coleccio
    GROUP BY E.Nom_Coleccio HAVING SUM(R.Pes) > 5000;

e. Selecciona la id de los clientes junto con cuántas entregas han comprado, siempre que sean más de 20

    SELECT CE.id_Client, COUNT(*) AS Num_Entregas FROM Client_Entrega CE GROUP BY CE.id_Client HAVING COUNT(*) > 20;



