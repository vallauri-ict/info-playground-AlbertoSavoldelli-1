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

/*Per le Opere di artisti italiani che non hanno personaggi, il titolo dell'opera e il nome dell'artista*/
SELECT o.Titolo,a.NomeA
FROM Artisti a, Opere o,Personaggi p
WHERE a.Nazionalita='IT'
AND a.NomeA=o.NomeA
AND NOT EXISTS(SELECT * FROM Personaggi p,Opere o WHERE p.Codice=o.Codice)

/*Il nome dei musei di londra che non hanno opere di artisti italiani, eccetto Tiziano*/
SELECT m.NomeM
FROM Musei m
WHERE  m.Citta='Londra'
AND NOT EXISTS(SELECT * FROM Opere o,Artisti a WHERE a.Nazionalita='IT' OR o.NomeA='Tiziano' AND o.NomeM=m.NomeM)


