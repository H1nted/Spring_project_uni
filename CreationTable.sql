DROP TABLE IF EXISTS Region;
CREATE TABLE Region (
    NumReg varchar(2) primary key,
    NomReg varchar(50)
);

DROP TABLE IF EXISTS Depatement;
create table Departement(
    numDep varchar(4) primary key,
    nomDep varchar(30),
    chefLieu varchar(6),
    numReg varchar(4)
);

DROP TABLE IF EXISTS Lieu;
create table Lieu(
    codeInsee varchar(6) primary key,
    nomCom varchar(46),
    longitude float,
    latitude float,
    dep varchar(4)
);

DROP TABLE IF EXISTS monument;
create table monument (
    geohash varchar(12) primary key,
    nom varchar(80), 
    proprietaire varchar(10), 
    typeM varchar(20), 
    longitude float, 
    latitude float, 
    codeInsee varchar(6)
);

DROP TABLE IF EXISTS Celebrite;
create table Celebrite(
    numCelebrite integer primary key, 
    nom varchar(16), 
    prenom varchar(16), 
    nationalite varchar(10),
    epoque varchar(6)
);


DROP TABLE IF EXISTS AssocieA;
create table AssocieA(
    codeM varchar(12), 
    numCelebrite integer, 
    constraint AssocieA_pk 
        primary key (codeM,numCelebrite)
);

DROP TABLE IF EXISTS utilisateurs;
CREATE TABLE utilisateurs (
    userName VARCHAR(20) PRIMARY KEY NOT NULL,
    passWord VARCHAR(250) NOT NULL,
    role VARCHAR(5) BINARY NOT NULL CHECK (role IN ('ADMIN', 'USER') AND role = BINARY role)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

Alter table Departement ADD constraint Dep_fk1 FOREIGN KEY(numReg)
    REFERENCES Region(NumReg);

Alter table Departement ADD CONSTRAINT Dep_fk FOREIGN KEY(chefLieu)
    REFERENCES Lieu (codeInsee) ;

Alter table Lieu ADD CONSTRAINT Lieu_fk FOREIGN KEY(dep)
    REFERENCES Departement (numDep) ;

Alter table monument ADD CONSTRAINT mon_fk FOREIGN KEY(codeInsee)
    REFERENCES Lieu(codeInsee);


alter table AssocieA ADD CONSTRAINT aa_fk1 FOREIGN KEY(codeM)
    REFERENCES Monument(geohash),
                    ADD CONSTRAINT aa_fk2 FOREIGN KEY(numCelebrite)
    REFERENCES Celebrite(numCelebrite);



    select A.codeM, A.numCelebrite, C.nom, C.prenom, M.nom from AssocieA A, Celebrite C, Monument M where
A.numCelebrite = C.numCelebrite and M.geohash = A.codeM ;
