
CREATE TABLE Admin
(
	IDAdmin              INTEGER NOT NULL AUTO_INCREMENT,
	KIme                 VARCHAR(50) NULL,
	Lozinka              VARCHAR(50) NULL,
	Ime                  VARCHAR(50) NULL,
	Prezime              VARCHAR(50) NULL,
	Email                VARCHAR(50) NULL,
	KodAdmina            INTEGER NULL,
   PRIMARY KEY (IDAdmin)  
);



CREATE TABLE Konobar
(
	IDKonobar            INTEGER NOT NULL AUTO_INCREMENT,
	KIme                 VARCHAR(50) NULL,
	Lozinka              VARCHAR(50) NULL,
	Ime                  VARCHAR(50) NULL,
	Prezime              VARCHAR(50) NULL,
	Email                VARCHAR(50) NULL,
	IDRestoranFK         INTEGER NOT NULL,
    PRIMARY KEY (IDKonobar)  
);



CREATE TABLE Korisnik
(
	IDKorisnik           INTEGER NOT NULL AUTO_INCREMENT,
	KIme                 VARCHAR(50) NULL,
	Lozinka              VARCHAR(50) NULL,
	Ime                  VARCHAR(50) NULL,
	Prezime              VARCHAR(50) NULL,
	Email                VARCHAR(50) NULL,
    PRIMARY KEY (IDKorisnik)  
);


CREATE TABLE NalaziSe
(
	IDOpstinaFK          INTEGER NOT NULL ,
	IDRestoranFK         INTEGER NOT NULL,
	IDNalaziSe           INTEGER NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (IDNalaziSe)  
);


CREATE TABLE Nudi
(
	IDOpcijaFK           INTEGER NOT NULL,
	IDRestoranFK         INTEGER NOT NULL,
	IDNudi               INTEGER NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (IDNudi)  
);



CREATE TABLE Opcija
(
	IDOpcija             INTEGER NOT NULL AUTO_INCREMENT,
	ImeOpcije            VARCHAR(50) NULL,
    PRIMARY KEY (IDOpcija)  
);



CREATE TABLE Opstina
(
	IDOpstina            INTEGER NOT NULL AUTO_INCREMENT,
	Naziv                VARCHAR(50) NULL,
    PRIMARY KEY (IDOpstina)  
);


CREATE TABLE Restoran
(
	IDRestoran           INTEGER NOT NULL AUTO_INCREMENT,
	KIme                 VARCHAR(50) NULL,
	Lozinka              VARCHAR(50) NULL,
	ImeObjekta           VARCHAR(50) NULL,
	ImeVlasnika          VARCHAR(50) NULL,
	PrezimeVlasnika      VARCHAR(50) NULL,
	Email                VARCHAR(50) NULL,
	Ocena                FLOAT NULL,
	KodKonobara          INTEGER NULL,
	Cena                 CHAR NULL,
	Slike                VARCHAR(50) NULL,
	BrojPosetilaca       INTEGER NULL,
    PRIMARY KEY (IDRestoran)  
);



CREATE TABLE Rezervacija
(
	IDRezervacija        INTEGER NOT NULL AUTO_INCREMENT,
	IDStoFK              INTEGER NOT NULL,
	IDKorisnikFK         INTEGER NOT NULL,
	Status               VARCHAR(50) NULL,
	Ocena                INTEGER NULL,
	VremeOd              TIMESTAMP NULL,
	VremeDo              TIMESTAMP NULL,
    PRIMARY KEY (IDRezervacija)  
);


CREATE TABLE Sto
(
	IDSto                INTEGER NOT NULL AUTO_INCREMENT,
	IDRestoranFK         INTEGER NOT NULL,
	BrojOsoba            INTEGER NULL,
    PRIMARY KEY (IDSto)  
);


ALTER TABLE Konobar
ADD CONSTRAINT R_6 FOREIGN KEY (IDRestoranFK) REFERENCES Restoran (IDRestoran);

ALTER TABLE NalaziSe
ADD CONSTRAINT R_14 FOREIGN KEY (IDOpstinaFK) REFERENCES Opstina (IDOpstina);

ALTER TABLE NalaziSe
ADD CONSTRAINT R_15 FOREIGN KEY (IDRestoranFK) REFERENCES Restoran (IDRestoran);

ALTER TABLE Nudi
ADD CONSTRAINT R_16 FOREIGN KEY (IDOpcijaFK) REFERENCES Opcija (IDOpcija);

ALTER TABLE Nudi
ADD CONSTRAINT R_17 FOREIGN KEY (IDRestoranFK) REFERENCES Restoran (IDRestoran);

ALTER TABLE Rezervacija
ADD CONSTRAINT R_8 FOREIGN KEY (IDStoFK) REFERENCES Sto (IDSto);

ALTER TABLE Rezervacija
ADD CONSTRAINT R_9 FOREIGN KEY (IDKorisnikFK) REFERENCES Korisnik (IDKorisnik);

ALTER TABLE Sto
ADD CONSTRAINT R_7 FOREIGN KEY (IDRestoranFK) REFERENCES Restoran (IDRestoran);