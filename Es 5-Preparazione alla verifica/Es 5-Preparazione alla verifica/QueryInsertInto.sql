INSERT INTO Proprietari(Nome,citta, stato)
VALUES('Tomba','Pinerolo'),
('Pape','Fossano'),
('Barbero','Mondovi')

INSERT INTO Assicurazioni(Nome,Sede)
VALUES('Vittoria','Carignano'),
('Toro','Pinerolo'),
('Sara','Fossano')

INSERT INTO Auto (Targa,Marca,Modello,Cilindrata,Potenza,CodF,CodAss)
VALUES('FX677TR','Maserati','Ghibli',3000,330,3,2),
('DV478PI','Ferrari','Testarossa',5000,700,1,1),
('FV448PO','Lamborghini','Urus',6000,600,2,3)

INSERT INTO Sinistri (Localita, Data)
VALUES ('Via Roma', '2012-08-10'),
('Piazza Venezia', '2020-08-04'),
('Via Cavour', '2021-01-21')

INSERT INTO Autocoinvolte (CodS,Targa,ImportoDelDanno)
VALUES (2, 'DV478PI', 5000),
(3, 'FV448PO', 10000),
(1, 'FX677TR', 3000)