/*Targa e Marca delle Auto di cilindrata superiore a 2000 cc o di potenza superiore a 120 CV*/
SELECT a.Targa, a.Marca
FROM Automobili a
WHERE a.Cilindrata > 2000 OR a.Potenza > 120
/*Targa e Nome del proprietario delle Auto di cilindrata superiore a 2000 cc oppure di potenza superiore a 120 CV, assicurate presso la “SARA”*/
SELECT p.Nome, a.Targa
FROM Automobili a, Proprietari p,Assicurazioni ass
WHERE p.CodF = a.CodF
AND ass.Nome='SARA'
AND a.CodAss=ass.CodAss
AND (a.Cilindrata > 2000 OR a.Potenza > 120)
/*Targa e Nome del proprietario delle Auto assicurate presso la “SARA” e coinvolte in sinistri il 20/01/02*/
SELECT a.Targa,p.Nome
FROM Assicurazioni ass,Proprietari p,Automobili a,Sinistro s,AutoCoinvolte ac
WHERE ass.Nome='SARA'
AND a.CodF=P.CodF
AND ac.CodS=s.CodS
AND s.DataSinistro='2002-01-20'
AND a.CodAss=ass.CodAss

/*La targa delle auto che non sono state coinvolte in sinistri dopo il 20/01/01*/
SELECT a.Targa
FROM Automobili a
WHERE NOT EXISTS(SELECT * FROM AutoCoinvolte ac,Sinistro s WHERE ac.CodS=s.CodS AND s.DataSinistro>'2001-01-20' AND ac.Targa=a.Targa)
