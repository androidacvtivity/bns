SELECT 

D.CUIIO
--'RIND. '||D.RIND||', CAEM Rev2: '||D.CAEM2||'- este grupa' AS REZULTAT

 FROM
 (
SELECT
D.CUIIO,   
D.RIND, CASE WHEN  D.CAPITOL IN(1127)  THEN D.COL31  ELSE NULL END AS CAEM2, CM.PRIM
  
FROM
 CIS2.VW_DATA_ALL D 
 INNER JOIN VW_CL_CAEM2 CM ON (CASE WHEN  D.CAPITOL IN(1127)  THEN D.COL31  ELSE NULL END ) = SUBSTR(CM.CODUL,2) 
WHERE
  (D.PERIOADA=:PERIOADA         OR :PERIOADA = -1) AND
 -- (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               OR :FORM = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1)
)
  D
  
 
   WHERE D.PRIM =0
   
   
     GROUP BY
  D.CUIIO  
   
    