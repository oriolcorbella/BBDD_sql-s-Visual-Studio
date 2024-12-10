CREATE DATABASE IF NOT EXISTS s3_c1_ej3;
USE s3_c1_ej3;

DROP TABLE IF EXISTS Client_Entrega;
DROP TABLE IF EXISTS Regal;
DROP TABLE IF EXISTS Entrega;
DROP TABLE IF EXISTS Subscriptor_Coleccio;
DROP TABLE IF EXISTS Subscriptor;
DROP TABLE IF EXISTS Coleccio;
DROP TABLE IF EXISTS Client;
DROP TABLE IF EXISTS Usuari;

CREATE TABLE Usuari (
    id_Usuari INT AUTO_INCREMENT,
    DNI CHAR(9) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Direccio VARCHAR(200) NOT NULL,
    Num_Targeta VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_Usuari)
);

CREATE TABLE Client (
    id_Client INT AUTO_INCREMENT,
    gusta_electronico BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (id_Client)
);

CREATE TABLE Subscriptor (
    id_Subscriptor INT,
    es_asociado BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (id_Subscriptor),
    FOREIGN KEY (id_Subscriptor) REFERENCES Usuari(id_Usuari)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE Coleccio (
    Nom_Coleccio VARCHAR(100),
    ano_inicio INT(4),
    ano_fin INT(4),
    PRIMARY KEY (Nom_Coleccio)
);

CREATE TABLE Subscriptor_Coleccio (
    id_Subscriptor INT,
    Nom_Coleccio VARCHAR(100),
    Num_Inici INT,
    PRIMARY KEY (id_Subscriptor, Nom_Coleccio),
    FOREIGN KEY (id_Subscriptor) REFERENCES Subscriptor(id_Subscriptor)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (Nom_Coleccio) REFERENCES Coleccio(Nom_Coleccio)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE Entrega (
    Data_Entrega DATE,
    Nom_Coleccio VARCHAR(100),
    Num_Pagines INT,
    PRIMARY KEY (Data_Entrega, Nom_Coleccio),
    FOREIGN KEY (Nom_Coleccio) REFERENCES Coleccio(Nom_Coleccio)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE Client_Entrega (
    id_Client INT,
    Data_Entrega DATE,
    Nom_Coleccio VARCHAR(100),
    PRIMARY KEY (id_Client, Data_Entrega, Nom_Coleccio),
    FOREIGN KEY (id_Client) REFERENCES Cliente(id_Client)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (Data_Entrega, Nom_Coleccio) REFERENCES Entrega(Data_Entrega, Nom_Coleccio)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE Regal (
    id_Regal INT AUTO_INCREMENT PRIMARY KEY,
    Data_Entrega DATE,
    Nom_Coleccio VARCHAR(100),
    Pes DECIMAL(10, 2) UNSIGNED,
    FOREIGN KEY (Data_Entrega, Nom_Coleccio) REFERENCES Entrega(Data_Entrega, Nom_Coleccio)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

# a)	Selecciona los usuarios, que son subscritores asociados.
SELECT u.* FROM usuario AS u, subscritor AS s
	WHERE u.id_usuario = s.id_subscritor AND es_asociado IS TRUE;

# b)	Selecciona los usuarios, que son clientes a los que no les gusta el formato electrónico.
SELECT u.* FROM usuario AS u, cliente AS c
	WHERE u.id_usuario = c.id_cliente AND gusta_electronico IS FALSE;

# c)	Selecciona las colecciones iniciadas antes del 1970 y terminadas antes del 2000.
SELECT * FROM coleccion WHERE ano_fin < 1970 AND ano_fin < 2000;

# d)	Selecciona el identificador de los subscritores que han iniciado la colección con nombre ‘Minerales del Mundo’ des del 1r número.
SELECT sc.id_subscritor FROM subscritor_coleccion AS sc
	WHERE sc.nombre_coleccion = 'Minerales del Mundo' AND num_inicio = 1;

# e)	Selecciona la id de los usuarios que no tengan un email válido (suponiendo que un mail válido tiene que contener una @).
SELECT id_usuario FROM usuario WHERE mail NOT LIKE '_%@_%._%';

# f)	Muestra las id’s de los regalos que pesan menos de 100g o más de 500g (suponiendo que el atributo peso se guarda en gramos).
SELECT id_regalo FROM regalo WHERE peso < 100 OR peso > 500;
SELECT id_regalo FROM regalo WHERE peso NOT BETWEEN 100 AND 500; 
	# Las dos opciones son válidas! el BETEEN tambíen se puede usar junto con el operador NOT!

# g)	Selecciona las entregas de enero del 2019.
SELECT * FROM entrega WHERE MONTH(fecha_entrega) = 1 AND YEAR(fecha_entrega) = 2019;

# h)	Selecciona las entregas del 31 de Diciembre de 2018 o del 1 de Enero del 2019.
SELECT * FROM entrega WHERE (DAY(fecha_entrega)=31 AND MONTH(fecha_entrega)=12 AND YEAR(fecha_entrega)=2018) 
	OR (DAY(fecha_entrega)=1 AND MONTH(fecha_entrega)=1 AND YEAR(fecha_entrega)=2019);

SELECT * FROM entrega WHERE fecha_entrega = '2018-12-31' OR fecha_entrega = '2019-01-01'; 
	# Al tener que filtrar por una fecha completa no nos hace falta utilizar funciones de fecha, podemos comparar con una fecha directamente!