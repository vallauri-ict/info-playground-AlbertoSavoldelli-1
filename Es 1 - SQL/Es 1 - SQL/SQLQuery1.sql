CREATE TABLE Impiegato(
nome varchar(30) PRIMARY KEY,
titolo varchar(50),
eta int NOT NULL,
salario decimal(12,2),
dip char(1)
)

CREATE TABLE [dbo].[Cliente]
(
	[idCliente] INT NOT NULL PRIMARY KEY, 
    [Nome] NCHAR(10) NOT NULL, 
    [Cognome] NCHAR(10) NOT NULL, 
    [Citta] NCHAR(10) NOT NULL, 
    [Stato] NCHAR(4) NOT NULL
)
CREATE TABLE [dbo].[Acquisto] (
	[Id]  INT NOT NULL PRIMARY KEY IDENTITY,
    [IdCliente] INT NOT NULL,
    [dataDiOrdinazione] DATE NOT NULL,
    [Item]  INT NOT NULL,
    [Quantita] INT NOT NULL,
    [Prezzo] DECIMAL (12, 2) NOT NULL,
);

INSERT INTO Cliente(nome,cognome,citta, stato)
VALUES('Alberto','Tomba','Pinerolo','IT'),
('Paperino','Pape','Fossano','IT'),
('Alberto','Barbero','Mondovi','IT')

INSERT INTO Impiegato VALUES
('Edoardo','',18,500,'s'),
('Edo','',52,300,'s'),
('Paolo','',38,700,'s')

SELECT *
FROM Impiegato
ORDER BY salario DESC

SELECT *
FROM Impiegato
ORDER BY salario,eta DESC

SELECT *
FROM Impiegato
WHERE nome IN ('Marta','Fabio','Ivan')

SELECT *
FROM Impiegato
WHERE nome NOT IN ('Marta','Fabio','Ivan')

SELECT *
FROM Impiegato
WHERE eta BETWEEN 20 AND 30   


SELECT nome,prezzo
FROM Acquisto a, Cliente c
WHERE a.IdCliente=C.idCliente