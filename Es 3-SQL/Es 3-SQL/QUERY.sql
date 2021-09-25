
/*3- Il titolo e la durata dei film di fantascienza giapponesi o francesi prodotti dopo il 1990*/
SELECT * 
FROM Film f
WHERE f.Genere='Fantascienza'
AND (f.Nazionalita='JP' OR f.Nazionalita='FR')
AND f.AnnoProduzione>1990

/*I titolo dei film dello stesso regista di “Casablanca”*/
SELECT f.Titolo
FROM Film f
WHERE f.Regista=(SELECT f1.Regista FROM Film f1 WHERE f1.Titolo='Casablanca')

/*Il titolo ed il genere dei film proiettati a Napoli il giorno di Natale 2004*/
SELECT f.Titolo, f.Genere
FROM Film f,Sale s, Proiezioni p
WHERE f.CodFilm=p.CodFilm
AND s.Citta='Napoli'
AND s.CodSala=p.CodSala
AND p.DataProiezione='25/12/2004'


/*I nomi delle sale di Napoli in cui il giorno di Natale 2004 è stato proiettato un film con R.Williams*/
SELECT s.Nome
FROM Film f,Sale s, Proiezioni p,Attori a,Recita r
WHERE f.CodFilm=p.CodFilm
AND s.Citta='Napoli'
AND s.CodSala=p.CodSala
AND p.DataProiezione='20041225'
AND a.Nome='R.Williams'
AND a.CodAttore=r.CodAttore
AND r.CodFilm=f.CodFilm

/*Il titolo dei film in cui recitano M. Mastroianni e S.Loren*/
SELECT f.Titolo
FROM Film f,Recita r,Attori a
WHERE a.CodAttore=r.CodAttore
AND f.CodFilm=r.CodFilm
AND f.CodFilm=(SELECT f.CodFilm
FROM Film f,Recita r,Attori a
WHERE a.CodAttore=r.CodAttore
AND f.CodFilm=r.CodFilm
AND a.Nome='Mastroianni'
AND a.Nome='Loren')

/*Soluzione Esposito*/
SELECT f.CodFilm
FROM Film f,Recita r,Attori a,Recita r2,Attori a2
WHERE a.CodAttore=r.CodAttore
AND f.CodFilm=r.CodFilm
AND a.Nome='Mastroianni'
AND f.CodFilm=r2.CodFilm
AND a.Nome='Loren'

/*soluzione 3*/
SELECT f.titolo
FROM Film f
WHERE 'Mastroianni' IN (
SELECT a.Nome
FROM Attori a,Recita r
WHERE r.CodAttore=a.CodAttore
AND r.CodFilm=f.CodFilm)
AND 'Loren' IN (
SELECT a.Nome
FROM Attori a,Recita r 
WHERE r.CodAttore=a.CodAttore
AND r.CodFilm=f.CodFilm)

/*Per ogni film che è stato proiettato a Pisa nel gennaio 2005, il titolo del film e il nome della sala.*/
SELECT f.Titolo,s.Nome
FROM Film f,Sale s,Proiezioni p
WHERE f.CodFilm=p.CodFilm
AND p.CodSala=s.CodSala
AND s.Citta='Pisa'
AND p.DataProiezione between '20050101' and '20050131'