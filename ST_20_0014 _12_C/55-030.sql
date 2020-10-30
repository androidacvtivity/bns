SELECT
 
  'Rind.100.COL4: '||SUM(CASE WHEN  D.PERIOADA =:PERIOADA   AND D.RIND IN ('100') THEN D.COL4 ELSE 0 END)||'  Rind.80.COL1: ' 
  
  ||''|| 
  
  SUM(CASE WHEN  D.PERIOADA =:PERIOADA-1   AND D.RIND IN ('100') THEN D.COL4 ELSE 0 END)
  AS REZULTAT

FROM
  VW_DATA_ALL D

WHERE
  (D.PERIOADA IN (:PERIOADA,:PERIOADA-1)         OR :PERIOADA = -1)                               AND
  (D.CUIIO=:CUIIO               OR :CUIIO = -1)                                  AND 
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1)                             AND
  (D.FORM = :FORM               OR :FORM = -1)                                   AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1)                              AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1)                                AND
  (D.CAPITOL_VERS=:CAPITOL_VERS  OR :CAPITOL_VERS  =-1)                          AND
  (:ID_MD=:ID_MD) AND 
  D.FORM IN (55) AND 
  D.CAPITOL IN (1079)
  
 
  HAVING 
  SUM(CASE WHEN  D.PERIOADA =:PERIOADA   AND D.RIND IN ('100') THEN NVAL(D.COL4) ELSE 0 END) <> 
  SUM(CASE WHEN  D.PERIOADA =:PERIOADA - 1   AND D.RIND IN ('100') THEN NVAL(D.COL4) ELSE 0 END)