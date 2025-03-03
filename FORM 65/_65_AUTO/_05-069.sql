﻿SELECT DISTINCT
'Rind. '||D.RIND||': '||
  ROUND(NVAL(SUM(CASE WHEN D.CAPITOL IN('312') THEN  D.COL1 ELSE 0 END))/
   NOZERO( nval(SUM(CASE WHEN D.CAPITOL IN('312') THEN  D.COL2 ELSE 0 END) )),4
   )*1000


  ||' nu apartine intervalului [16.40-19.00]'  
  
  AS REZULTAT

FROM
  VW_DATA_ALL D      
WHERE
  (D.PERIOADA=:PERIOADA         OR :PERIOADA = -1) AND
  (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL=-1)  AND  
  (:FORM = :FORM) AND 
  D.FORM IN (5) AND
  D.CAPITOL IN (312)
 
 GROUP BY D.RIND
HAVING

( 
ROUND(
   NVAL(SUM(CASE WHEN D.CAPITOL IN('312') THEN  D.COL1 ELSE 0 END))/
   NOZERO( nval(SUM(CASE WHEN D.CAPITOL IN('312') THEN  D.COL2 ELSE 0 END) )),4
   )*1000
   >19.00
 
AND
 
ROUND(
   NVAL(SUM(CASE WHEN D.CAPITOL IN('312') THEN  D.COL1 ELSE 0 END))/
   NOZERO( nval(SUM(CASE WHEN D.CAPITOL IN('312') THEN  D.COL2 ELSE 0 END) )),4
   )*1000
   <> 0
)
   
  OR 
   
(

ROUND(
   NVAL(SUM(CASE WHEN D.CAPITOL IN('312') THEN  D.COL1 ELSE 0 END))/
   NOZERO( nval(SUM(CASE WHEN D.CAPITOL IN('312') THEN  D.COL2 ELSE 0 END) )),4
   )*1000
   <16.4
   
   AND
  
ROUND(
   NVAL(SUM(CASE WHEN D.CAPITOL IN('312') THEN  D.COL1 ELSE 0 END))/
   NOZERO( nval(SUM(CASE WHEN D.CAPITOL IN('312') THEN  D.COL2 ELSE 0 END) )),4
   )*1000
   <> 0)