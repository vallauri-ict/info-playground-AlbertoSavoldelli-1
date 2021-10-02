/*Per ciascun museo di Londra, il numero di opere di artisti italiani ivi conservate*/

SELECT m.NomeM, count(*) as numeroOpere
FROM Artisti a, Opere o, Musei m
WHERE a.Nazionalita='IT'
AND a.NomeA=o.NomeA
AND m.NomeM=o.NomeM
AND m.Citta='Londra'
GROUP BY m.NomeM

/*Il nome dei musei di londra che non hanno opere di Tiziano*/
SELECT m.NomeM
FROM Musei m
WHERE  m.Citta='Londra'
AND NOT EXISTS(SELECT * FROM Opere o WHERE o.NomeA='Tiziano' AND o.NomeM=m.NomeM)

/*Il nome dei musei di londra che hanno solo opere di Tiziano*/
SELECT m.NomeM
FROM Musei m
WHERE  m.Citta='Londra'
AND NOT EXISTS(SELECT * FROM Opere o WHERE o.NomeA<>'Tiziano' AND o.NomeM=m.NomeM)

/*Per ogni artista, il suo nome e il numero delle sue opere conservate negli uffizi*/
SELECT a.NomeA, count(*) as nOpere
FROM Artisti a, Opere o
WHERE o.NomeM='Uffizi'
AND a.NomeA=o.NomeA
GROUP BY a.NomeA

/* I musei che conservano almeno 20 opere di artisti italiani */
SELECT o.NomeMuseo, COUNT(*) AS NumeroOpere
FROM Opere o, Artisti a
WHERE o.NomeA = a.NomeA
AND a.Nazionalita = 'ITA'
GROUP BY o.NomeMuseo
HAVING COUNT(*)>19

/* Titolo dell'opera e nome dell'artista per ogni opera di un artista italiano senza personaggio */
SELECT a.NomeA, o.Titolo
FROM Artisti a, Opere o
WHERE a.Nazionalita='IT'
AND a.NomeA=o.NomeA
AND NOT EXISTS(SELECT * FROM Personaggi p WHERE p.Codice=o.Codice)

/* Il nome dei musei di Londra che non hanno opere di artisti italiani, eccetto Tiziano */
SELECT m.NomeMuseo
FROM Musei m
WHERE  m.Citta='Londra'
AND NOT EXISTS(SELECT * FROM Opere o,Artisti a 
	WHERE a.Nazionalita='IT' OR o.NomeA<>'Tiziano' AND o.NomeMuseo=m.NomeMuseo)

/* Per ogni museo, il numero di opere divise per nazionalità dell'artista*/
SELECT o.NomeMuseo, a.Nazionalita, count(*) as NumeroOpere
FROM Opere o, Artisti a
WHERE o.NomeA = a.NomeA
GROUP BY a.Nazionalita, o.NomeMuseo
ORDER BY o.NomeMuseo

UPDATE Artisti
SET Nazionalita = 'ESP'
WHERE NomeA = 'Picasso'

DELETE FROM Artisti WHERE NomeA = 'Pol'


