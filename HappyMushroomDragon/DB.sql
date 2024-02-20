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
	Id		INT	PRIMARY KEY NOT NULL IDENTITY(1,1),
	Nome	VARCHAR(20),
	Cognome	VARCHAR(20),
	Eta		DATETIME2,
	Paese	VARCHAR(10),
	Email	VARCHAR(50),
	Pass	VARCHAR(50)
);
GO

CREATE TABLE Account (
	IdUser			INT			PRIMARY KEY NOT NULL,
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
	IdAccount INT REFERENCES Account(IdUser) NOT NULL,
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
	IdUtente		INT				REFERENCES Utente(Id) NOT NULL,
	Contenuto		VARCHAR(500),
	Suggerimento	VARCHAR(250),
	Valutazione		INT ,
	PRIMARY KEY(IdUtente, DataScrittura)
);
GO

CREATE TABLE Partita (
	Id				INT			PRIMARY KEY IDENTITY(1,1) NOT NULL,
	DataIzio		DATETIME2,
	Tempo			TIME,
	Punti			INT,
	NomePersonaggio	VARCHAR(20)  REFERENCES Personaggio(Nome) NOT NULL,
	IdSfondo		INT			 REFERENCES Sfondo(Id) NOT NULL,
	IdUtente		INT			 REFERENCES Utente(Id) NOT NULL
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
	(Nome, Cognome, Eta, Paese, Email, Pass)
	VALUES
	('Mario', 'Rossi', '1990-05-15', 'Italia', 'mario.rossi@email.com', 'password1'),
	('Giulia', 'Bianchi', '1985-08-20', 'Italia', 'giulia.bianchi@email.com', 'password2'),
	('Luca', 'Verdi', '1992-03-10', 'Italia', 'luca.verdi@email.com', 'password3'),
	('Paolo', 'Neri', '1988-11-25', 'Italia', 'paolo.neri@email.com', 'password4'),
	('Anna', 'Russo', '1995-02-18', 'Italia', 'anna.russo@email.com', 'password5'),
	('Marco', 'Gallo', '1980-07-30', 'Italia', 'marco.gallo@email.com', 'password6'),
	('Laura', 'Ferrari', '1983-09-05', 'Italia', 'laura.ferrari@email.com', 'password7'),
	('Simone', 'Marini', '1993-12-12', 'Italia', 'simone.marini@email.com', 'password8'),
	('Francesca', 'Conti', '1986-04-22', 'Italia', 'francesca.conti@email.com', 'password9'),
	('Davide', 'Lombardi', '1991-06-28', 'Italia', 'davide.lombardi@email.com', 'password10'),
	('Giorgio', 'Moretti', '1982-01-17', 'Italia', 'giorgio.moretti@email.com', 'password11'),
	('Martina', 'Barbieri', '1994-07-03', 'Italia', 'martina.barbieri@email.com', 'password12'),
	('Sara', 'Galli', '1987-10-09', 'Italia', 'sara.galli@email.com', 'password13'),
	('Roberto', 'Fabbri', '1989-04-05', 'Italia', 'roberto.fabbri@email.com', 'password14'),
	('Elena', 'Santoro', '1996-11-20', 'Italia', 'elena.santoro@email.com', 'password15'),
	('Alessandro', 'Greco', '1984-03-08', 'Italia', 'alessandro.greco@email.com', 'password16'),
	('Veronica', 'Longo', '1990-09-14', 'Italia', 'veronica.longo@email.com', 'password17'),
	('Fabio', 'Ferrara', '1981-05-27', 'Italia', 'fabio.ferrara@email.com', 'password18'),
	('Chiara', 'Mancini', '1993-08-02', 'Italia', 'chiara.mancini@email.com', 'password19'),
	('Andrea', 'Gatti', '1988-12-30', 'Italia', 'andrea.gatti@email.com', 'password20');

INSERT INTO Account 
	(NickName, IdUser, Punteggio, PartiteGiocare, PartiteVinte, Soldi)
	VALUES 
	('Baldo', 1, 1000, 20, 15, 1500),
    ('Sole24Ore', 2, 800, 15, 10, 700),
    ('tomare', 3, 1200, 25, 20, 250);

INSERT INTO Personaggio 
	(Nome, Vita, AnimazioneGame, AnimazioneLogin, Costo)
	VALUES 
	('personaggio1', 100, 'anim_game_1', 'anim_login_1', 50),
    ('personaggio2', 120, 'anim_game_2', 'anim_login_2', 60),
    ('personaggio3', 150, 'anim_game_3', 'anim_login_3', 70);

INSERT INTO Possiede
	(IdAccount, NomePersonaggio)
	VALUES
	(1, 'personaggio1'),
	(1, 'personaggio2'),
	(1, 'personaggio3'),
	(2, 'personaggio1');

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
	('2024-02-13 10:30:00', 1, 'Recensione 1', 'Suggerimento 1', 4),
    ('2024-02-14 11:45:00', 2, 'Recensione 2', 'Suggerimento 2', 5),
    ('2024-02-15 12:00:00', 3, 'Recensione 3', 'Suggerimento 3', 3);

INSERT INTO Partita 
	(DataIzio, Tempo, Punti, NomePersonaggio, IdSfondo, IdUtente)
	VALUES 
	('2024-02-13 15:00:00', '10:30', 500, 'personaggio1', 1, 1),
    ('2024-02-14 16:00:00', '12:45', 600, 'personaggio2', 2, 2),
    ('2024-02-15 17:00:00', '14:00', 700, 'personaggio3', 3, 3);

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