SELECT 
    
'Rind:'||L.RIND||'.COL3 - '||SUM(L.COL3)||'.COL4 - '||NVAL(SUM(R.COL3)) 

    AS REZULTAT
        
FROM
( 

SELECT
    D.NR_GOSP,
    D.RIND,
    SUM(D.COL3) AS COL3

        FROM 
 VW_DATA_ALL_GC D
 
WHERE
  (D.PERIOADA=:PERIOADA         OR :PERIOADA = -1) AND
  (D.NR_GOSP=:NR_GOSP               OR :NR_GOSP = -1) AND
  (D.UNIT_CODE_VERS=:UNIT_CODE_VERS     OR :UNIT_CODE_VERS = -1) AND
  (D.FORM = :FORM               OR :FORM = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (:CAPITOL=:CAPITOL            OR :CAPITOL <> :CAPITOL) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  D.FORM IN (58)  
  AND  D.CAPITOL IN (417)
  
  GROUP BY 
  D.NR_GOSP,
  D.RIND
  
  HAVING 
  SUM(D.COL3) <> 0  
  
  ) L  LEFT JOIN (
  
   SELECT
    D.NR_GOSP,
    D.RIND,
    SUM(D.COL4) AS COL3

        FROM 
 VW_DATA_ALL_GC D
 
WHERE
  (D.PERIOADA=:PERIOADA         OR :PERIOADA = -1) AND
  (D.NR_GOSP=:NR_GOSP               OR :NR_GOSP = -1) AND
  (D.UNIT_CODE_VERS=:UNIT_CODE_VERS     OR :UNIT_CODE_VERS = -1) AND
  (D.FORM = :FORM               OR :FORM = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (:CAPITOL=:CAPITOL            OR :CAPITOL <> :CAPITOL) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  D.FORM IN (58)  
  AND  D.CAPITOL IN (417)
  
  GROUP BY 
  D.NR_GOSP,
  D.RIND
  
  HAVING 
  SUM(D.COL4) <> 0  
  
  
  ) R ON L.NR_GOSP = R.NR_GOSP AND L.RIND = R.RIND 
   


        WHERE 
        R.RIND IS  NULL
          
  
        GROUP BY      

        L.RIND

