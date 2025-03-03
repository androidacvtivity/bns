﻿SELECT DISTINCT 
  'Rind.'||D.RIND||'  COL1 - '||SUM(D.COL1)||'  COL7 - '||SUM(D.COL7)
  
  AS REZULTAT

FROM
  VW_DATA_ALL D                                     


WHERE
  (D.PERIOADA=:PERIOADA         OR :PERIOADA = -1) AND
  (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               OR :FORM = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  D.FORM IN (39)  AND
  D.CAPITOL IN (393)
  
  AND D.RIND IN ('01', '02', '03', '04', '05', '06','07','08','10','11','12','13','14','15','16','17')
  
 GROUP BY 
 
 D.RIND


HAVING 

(
SUM(D.COL1) > 0 

AND 

SUM(D.COL7) IS NULL 
)
OR 


(
SUM(D.COL1) IS NULL  

AND 

SUM(D.COL7)  > 0 
)
