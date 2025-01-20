-- 1. Selecciona les coleccions amb un nom dallargada menor a 10 caràcters --
    SELECT * FROM Coleccio WHERE LENGTH(Nom_Colecio) > 10;

-- 2. Retorna la data i hora actuals -- 
    SELECT NOW();
    o
    SELECT CONCAT (CURRENT_DATE(),"", CURRENT_TIME);

-- 3. Retorna totes les entregues on la seva data sigui en el futur (més gran que l'actual). 
    SELECT * FROM Entrega WHERE Data_Entrega > CURRENT_DATE();

-- 4. Tenim una taula de nom cercles amb i un atribut radi. Calclula per cada un el perímetre de la circumferència (2*Pi*r)
    SELECT 2*PI()*r FROM cercles;

-- 5. Tenim una taula de productes amb el preu del producte i l'impost a aplicar. Retorna tots els preus amb l'impost corresponent aplicat
    SELECT

-- 6. Retorna els regals que no tinguis pes assignat
    SELECT * FROM Regal WHERE Pes = NULL

-- 7. Retorna una llista amb els mails vàlids (format: NOM@DOMINI.ALGO)


-- 8. Retorna les entregues que tinguin entre 50 i 60 pàgines
    SELECT * FROM Entrega WHERE num_pagines BETWEEN 50 AND 60

-- 9. Crea una vista amb el resultat d'un select dels DNI, i targeta dels subscriptors associats d'aquest document
    SELECT DNI, num_targeta FROM Usuari WHERE ID_Usuari IN (SELECT ID_Usuari FROM Subscriptor);