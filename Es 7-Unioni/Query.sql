SELECT  Data
from VenditeInternet
INTERSECT
SELECT Data
from VenditeNegozio
ORDER BY Data desc