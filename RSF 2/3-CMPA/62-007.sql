﻿SELECT  
 
 'rind 6505 Col.1 nu este completat'
 
 
 AS REZULTAT

FROM
  CIS2.VW_DATA_ALL_GC D 
        
WHERE
  (D.PERIOADA=:PERIOADA          OR :PERIOADA = -1) AND
  (D.NR_GOSP=:NR_GOSP               OR :NR_GOSP = -1) AND
  (D.UNIT_CODE_VERS=:UNIT_CODE_VERS    OR :UNIT_CODE_VERS = -1) AND
  (D.FORM = :FORM               OR :FORM = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (D.CAPITOL=:CAPITOL            OR :CAPITOL = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
 
  D.FORM IN (62)     
 
  
HAVING
 
 SUM(CASE WHEN D.CAPITOL IN ('1115') AND TRIM(D.RIND) IN '6010'  THEN NVAL(D.COL1)  ELSE  0  END) >   0  
 AND 
 SUM(CASE WHEN D.CAPITOL IN ('1115') AND TRIM(D.RIND) IN '6505'  THEN NVAL(D.COL1)  ELSE  0  END) =    0  
 