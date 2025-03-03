SELECT
  'Rindu 20 sau 21 trebue sa fie = 1' AS REZULTAT

FROM 
  CIS2.VW_DATA_ALL D

WHERE
  (D.PERIOADA=:PERIOADA         OR :PERIOADA = -1) AND
  (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               OR :FORM = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  D.FORM IN (40)  AND
  D.CAPITOL IN (1031)
  
HAVING
  (
  NVAL(SUM(CASE WHEN D.RIND IN '20' THEN CIS2.NVAL(COL1) ELSE 0 END)) +
  NVAL(SUM(CASE WHEN D.RIND IN '21' THEN CIS2.NVAL(COL1) ELSE 0 END))) = 0 
  OR
  (SUM(CASE WHEN D.RIND IN ('20','21') THEN CIS2.NVAL(COL1) ELSE 0 END)) > 1