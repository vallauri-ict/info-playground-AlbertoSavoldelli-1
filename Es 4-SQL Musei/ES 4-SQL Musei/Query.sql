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