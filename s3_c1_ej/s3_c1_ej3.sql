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
    Num_Targeta VARCHAR(50) NOT NULL
    PRIMARY KEY (id_Usuari)
);

CREATE TABLE Cliente (
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