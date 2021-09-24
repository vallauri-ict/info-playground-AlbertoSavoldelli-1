SELECT *
FROM Volo v
WHERE v.CittaArr='Roma'
ORDER BY v.CittaPart

SELECT a.Città
FROM Aeroporto a
WHERE a.NumPiste IS NULL

SELECT v.IdVolo, a.NumPasseggeri
FROM Aereo a, Volo v
WHERE a.TipoAereo=v.TipoAereo 
AND a.QtaMerci>0
AND a.NumPasseggeri>0