CREATE DATABASE s3.c1.ej2 ;
DEFAULT CHARACTER SET 'utf8'
DEFAULT COLLATE 'utf8_spanish_ci';

CREATE TABLE IF NOT EXISTS Persona (
    Num_SS INT NOT NULL,
    Nom VARCHAR(15) NOT NULL,
    Cognom1 VARCHAR(20) NOT NULL,
    Cognom2 VARCHAR(20) NOT NULL,
    PRIMARY KEY (Num_SS)
 );

CREATE TABLE IF NOT EXISTS Arbitre (
    Num_SS_Arbitre INT,
    Num_Col·legiat INT,
    Any_Inici INT,
    Professio VARCHAR(20),
    PRIMARY KEY (Num_SS_Arbitre),
    FOREIGN KEY (Num_SS_Arbitre) REFERENCES Persona(Num_SS)
        ON UPDATE CASCADE
        ON DELETE CASCADE
 );

CREATE TABLE IF NOT EXISTS Jugador (
    Num_SS_Jugador INT,
    Dorsal INT(2),
    Ubicacio VARCHAR(50),
    Fitxa DECIMAL,
    Nom_Equip VARCHAR(40),
    PRIMARY KEY (Num_SS_Jugador),
    FOREIGN KEY (Nom_Equip) REFERENCES Equip (Nom_Equip)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (Num_SS_Jugador) REFERENCES Persona(Num_SS)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Equip (
    Nom_Equip VARCHAR(40),
    Any_Fundacio INT(4),
    Pressupost INT,
    President VARCHAR(40),
    Entrenador VARCHAR(40),
    Direccio VARCHAR(50),
    PRIMARY KEY (Nom_Equip)
 ); 

CREATE TABLE IF NOT EXISTS Partit (
    Num_SS_Arbitre INT,
    Equip_Local VARCHAR(40),
    Equip_Visitant VARCHAR(40),
    Resultat INT(4),
    Data_Partit DATE,
    PRIMARY KEY (Num_SS_Arbitre, Equip_Local, Equip_Visitant),
    FOREIGN KEY (Num_SS_Arbitre) REFERENCES Arbitre(Num_SS_Arbitre)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (Equip_Local) REFERENCES Equip(Nom_Equip)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (Equip_Visitant) REFERENCES Equip(Nom_Equip)
        ON UPDATE CASCADE
        ON DELETE CASCADE
); 
