﻿SELECT 

 'Completati tab.2 col1. rind 6210'   AS REZULTAT 

FROM 

(
SELECT
  D.NR_GOSP,
  'Rind. '||MR.RIND||': '||
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1117) THEN CIS2.NVAL(D.COL5) ELSE 0 END)) AS REZULTAT
  


FROM CIS2.VW_DATA_ALL_GC D

                                INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD

WHERE
  (D.PERIOADA=:PERIOADA         OR :PERIOADA = -1) AND
  (D.NR_GOSP=:NR_GOSP               OR :NR_GOSP = -1) AND
  (D.UNIT_CODE_VERS=:UNIT_CODE_VERS     OR :UNIT_CODE_VERS = -1) AND
  (D.FORM = :FORM               OR :FORM = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (:CAPITOL=:CAPITOL            OR :CAPITOL <> :CAPITOL) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  D.FORM IN (62)  AND
  D.CAPITOL IN (1117)  
 
  
GROUP BY 
MR.RIND,
D.NR_GOSP
  
HAVING 
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1117) THEN CIS2.NVAL(D.COL5) ELSE 0 END))  > 0   
  
 
  )  L  LEFT JOIN (
  
  SELECT
  D.NR_GOSP,
  'Rind. '||MR.RIND||': '||
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1116) THEN CIS2.NVAL(D.COL1) ELSE 0 END)) AS REZULTAT
  


FROM CIS2.VW_DATA_ALL_GC D

                                INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD

WHERE
  (D.PERIOADA=:PERIOADA         OR :PERIOADA = -1) AND
  (D.NR_GOSP=:NR_GOSP               OR :NR_GOSP = -1) AND
  (D.UNIT_CODE_VERS=:UNIT_CODE_VERS     OR :UNIT_CODE_VERS = -1) AND
  (D.FORM = :FORM               OR :FORM = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (:CAPITOL=:CAPITOL            OR :CAPITOL <> :CAPITOL) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  D.FORM IN (62)  AND
  D.CAPITOL IN (1116)   AND MR.RIND IN ('6210')
 
  
GROUP BY 
MR.RIND,
D.NR_GOSP
  
HAVING 
  CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1116) THEN CIS2.NVAL(D.COL1) ELSE 0 END))  > 0   
  
 
 
  

ORDER BY MR.RIND
  
  )    R ON L.NR_GOSP = R.NR_GOSP 
  


     WHERE 
     
     L.REZULTAT  IS NOT NULL 
     
     AND 
     
     R.REZULTAT IS NULL 

