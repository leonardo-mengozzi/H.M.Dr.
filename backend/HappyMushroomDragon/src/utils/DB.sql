USE MASTER;
GO 

IF DB_ID('Db_HMD') IS NOT NULL BEGIN 
DROP DATABASE Db_HMD;
END
GO

CREATE DATABASE Db_HMD;
GO

USE Db_HMD;
GO

CREATE TABLE Utente (
	Id		VARCHAR(28)	PRIMARY KEY NOT NULL,
	Nome	VARCHAR(20),
	Cognome	VARCHAR(20),
	Eta		DATETIME2,
	Paese	VARCHAR(10),
);
GO

CREATE TABLE Account (
	IdUser			VARCHAR(28)		PRIMARY KEY NOT NULL,
	NickName		VARCHAR(20),
	Punteggio		INT,
	PartiteGiocare	INT,
	PartiteVinte	INT,
	Soldi			INT,
	FOREIGN KEY (IdUser) REFERENCES Utente (Id)
);
GO

CREATE TABLE Personaggio (
	Nome			VARCHAR(20)		PRIMARY KEY NOT NULL,
	Vita			INT,
	AnimazioneGame	VARCHAR(100),
	AnimazioneLogin	VARCHAR(100),
	Costo			INT
);
GO

CREATE TABLE Possiede (
	IdAccount VARCHAR(28) REFERENCES Account(IdUser) NOT NULL,
	NomePersonaggio  VARCHAR(20) REFERENCES Personaggio(Nome) NOT NULL,
	PRIMARY KEY (IdAccount, NomePersonaggio)
);
GO

CREATE TABLE Nemico (
	Id				INT		PRIMARY KEY NOT NULL IDENTITY(1,1),
	Vita			INT,
	AnimazioneGame	VARCHAR(100)
);
GO

CREATE TABLE Sfondo (
	Id			INT				PRIMARY KEY NOT NULL IDENTITY(1,1),
	Animazione	VARCHAR(100)
);
GO

CREATE TABLE Ostacolo (
	Id			INT				PRIMARY KEY NOT NULL IDENTITY(1,1),
	Animazione	VARCHAR(100)
);
GO

CREATE TABLE Recensione (
	DataScrittura	DATETIME2		NOT NULL,
	IdUtente		VARCHAR(28)		REFERENCES Utente(Id) NOT NULL,
	Contenuto		VARCHAR(500),
	Suggerimento	VARCHAR(250),
	Valutazione		INT ,
	PRIMARY KEY(IdUtente, DataScrittura)
);
GO

CREATE TABLE Partita (
	Id				INT			 PRIMARY KEY IDENTITY(1,1) NOT NULL,
	DataIzio		DATETIME2,
	Tempo			TIME,
	Punti			INT,
	NomePersonaggio	VARCHAR(20)  REFERENCES Personaggio(Nome) NOT NULL,
	IdSfondo		INT			 REFERENCES Sfondo(Id) NOT NULL,
	IdAccount		VARCHAR(28)	 REFERENCES Account(IdUser) NOT NULL
);
GO

CREATE TABLE PartitaOstacolo (
	IdPartita		INT REFERENCES Partita(Id) NOT NULL,
	IdOstacolo		INT REFERENCES Ostacolo(Id) NOT NULL,
	NumeroOstacoli	INT,
	PRIMARY KEY (IdPartita, IdOstacolo)
);
GO

CREATE TABLE PartitaNemico (
	IdPartita		INT			REFERENCES Partita(Id) NOT NULL,
	IdNemico		INT			REFERENCES Nemico(Id) NOT NULL,
	NumeroNemici	INT,
	PRIMARY KEY (IdPartita, IdNemico)
);
GO


INSERT INTO Utente
	(Id, Nome, Cognome, Eta, Paese)
	VALUES
	('asdferaòjfhasjklfhlrivty','Mario', 'Rossi', '1990-05-15', 'Italia'),
	('asldjkfqpouiyvcljhlfkjha','Giulia', 'Bianchi', '1985-08-20', 'Italia'),
	('qweproiy12lkjhpv0alkj4kh','Luca', 'Verdi', '1992-03-10', 'Italia'),
	('LASKFJHALKFJHALJKFHASLJK', 'Paolo', 'Neri', '1988-11-25', 'Italia'),
	('AòLDFòASLKFAòFASKLòFJASD', 'Anna', 'Russo', '1995-02-18', 'Italia');

INSERT INTO Account 
	(NickName, IdUser, Punteggio, PartiteGiocare, PartiteVinte, Soldi)
	VALUES 
	('Baldo', 'asdferaòjfhasjklfhlrivty', 1000, 20, 15, 1500),
    ('Sole24Ore', 'asldjkfqpouiyvcljhlfkjha', 800, 15, 10, 700),
    ('tomare', 'qweproiy12lkjhpv0alkj4kh', 1200, 25, 20, 250);

INSERT INTO Personaggio 
	(Nome, Vita, AnimazioneGame, AnimazioneLogin, Costo)
	VALUES 
	('personaggio1', 100, 'anim_game_1', 'anim_login_1', 50),
    ('personaggio2', 120, 'anim_game_2', 'anim_login_2', 60),
    ('personaggio3', 150, 'anim_game_3', 'anim_login_3', 70);

INSERT INTO Possiede
	(IdAccount, NomePersonaggio)
	VALUES
	('asdferaòjfhasjklfhlrivty', 'personaggio1'),
	('asldjkfqpouiyvcljhlfkjha', 'personaggio2'),
	('qweproiy12lkjhpv0alkj4kh', 'personaggio3');

INSERT INTO Nemico 
	(Vita, AnimazioneGame)
	VALUES 
	(80, 'anim_game_nemico_1'),
    (100, 'anim_game_nemico_2'),
    (120, 'anim_game_nemico_3');

INSERT INTO Sfondo 
	(Animazione)
	VALUES 
	('anim_sfondo_1'),
    ('anim_sfondo_2'),
    ('anim_sfondo_3');

INSERT INTO Ostacolo 
	(Animazione)
	VALUES 
	('anim_ostacolo_1'),
    ('anim_ostacolo_2'),
    ('anim_ostacolo_3');

INSERT INTO Recensione 
	(DataScrittura, IdUtente, Contenuto, Suggerimento, Valutazione)
	VALUES 
	('2024-02-13 10:30:00', 'asdferaòjfhasjklfhlrivty', 'Recensione 1', 'Suggerimento 1', 4),
    ('2024-02-14 11:45:00', 'asldjkfqpouiyvcljhlfkjha', 'Recensione 2', 'Suggerimento 2', 5),
    ('2024-02-15 12:00:00', 'qweproiy12lkjhpv0alkj4kh', 'Recensione 3', 'Suggerimento 3', 3);

INSERT INTO Partita 
	(DataIzio, Tempo, Punti, NomePersonaggio, IdSfondo, IdAccount)
	VALUES 
	('2024-02-13 15:00:00', '10:30', 500, 'personaggio1', 1, 'asdferaòjfhasjklfhlrivty'),
    ('2024-02-14 16:00:00', '12:45', 600, 'personaggio2', 2, 'asldjkfqpouiyvcljhlfkjha'),
    ('2024-02-15 17:00:00', '14:00', 700, 'personaggio3', 3, 'qweproiy12lkjhpv0alkj4kh');

INSERT INTO PartitaOstacolo 
	(IdPartita, IdOstacolo, NumeroOstacoli)
	VALUES 
	(1, 1, 5),
    (2, 2, 6),
    (3, 3, 7);

INSERT INTO PartitaNemico 
	(IdPartita, IdNemico, NumeroNemici)
	VALUES 
	(1, 1, 10),
    (2, 2, 8),
    (3, 2, 12);