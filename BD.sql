DROP TABLE if EXISTS Personne; DROP TABLE if EXISTS Client;
DROP TABLE if EXISTS Possède;
DROP TABLE if EXISTS Qualification; DROP TABLE if EXISTS Tarif;
DROP TABLE if EXISTS Demande;
DROP TABLE if EXISTS Contrat;

CREATE TABLE Personne (
N°sécurité_sociale INT(15) NOT NULL PRIMARY KEY, Nom_Per VARCHAR(30) NOT NULL,
Prénom_Per VARCHAR(30),
Date_de_naissance_Per DATE,
Adresse_Per VARCHAR(50),
Contact_Per INT(10)
);

CREATE TABLE Client (
N°client INT NOT NULL PRIMARY KEY, Raison_sociale_Client varchar(50) , Adresse_Client varchar(50) , Secteur_Client varchar(50)
);

CREATE TABLE Possède (
CONSTRAINT RefPersonne_Possède FOREIGN KEY (RefPersonne) REFERENCES Personne (N°sécurité_sociale),
CONSTRAINT RefQualification_Possède FOREIGN KEY (RefQualification) REFERENCES Qualification (Code_Qualif),
PRIMARY KEY (N°sécurité_sociale, Code_Qualif) );

CREATE TABLE Qualification ( Code_Qualif INT NOT NULL PRIMARY KEY, Libellé_Qualif VARCHAR,
CONSTRAINT RefTarif_Qualification FOREIGN KEY (RefTarif)
REFERENCES Tarif (Code_Tarif) );

CREATE TABLE Tarif (
Code_Tarif INT NOT NULL PRIMARY KEY, Tarif_journalier DECIMAL
);

CREATE TABLE Demande (
N°demande INT NOT NULL PRIMARY KEY, Statut_Demande VARCHAR,
CONSTRAINT RefClient_Demande FOREIGN KEY (RefClient) REFERENCES Client (N°client),
CONSTRAINT RefContrat_Demande FOREIGN KEY (RefContrat) REFERENCES Contrat(N°contrat),
CONSTRAINT RefQualification_Demande FOREIGN KEY (RefQualification)
REFERENCES Qualification (Code_Qualif) );

CREATE TABLE Contrat (
N°contrat INT NOT NULL PRIMARY KEY, Description_Contrat VARCHAR, Date_de_début_Contrat DATE, Nombre_de_jours/homme_Contrat DECIMAL, Date_de_signature_Contrat DATE,
CONSTRAINT RefClient_Contrat FOREIGN KEY (RefClient) REFERENCES Client (N°client),
CONSTRAINT RefDemande_Contrat FOREIGN KEY (RefDemande)
REFERENCES Demande (N°demande) );