﻿SELECT 
D.CUIIO,
SUM(CASE WHEN D.FORM = 63 AND D.CAPITOL = 1120 AND D.RIND IN ('010') THEN D.COL1 ELSE NULL END) AS COL1,
SUM(CASE WHEN D.FORM = 57 AND D.CAPITOL = 1090 AND D.RIND IN ('050') THEN D.COL2 ELSE NULL END) AS COL2

FROM CIS2.VW_DATA_ALL_FR D

WHERE 
D.PERIOADA = 2009
AND D.FORM IN (57,63) 
GROUP BY
D.CUIIO


HAVING 

SUM(CASE WHEN D.FORM = 63 AND D.CAPITOL = 1120 AND D.RIND IN ('010') THEN D.COL1 ELSE NULL END) IS NOT NULL
OR 

SUM(CASE WHEN D.FORM = 57 AND D.CAPITOL = 1090 AND D.RIND IN ('050') THEN D.COL2 ELSE NULL END)  IS NOT NULL

ORDER BY 
D.CUIIO