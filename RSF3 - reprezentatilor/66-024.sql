SELECT 
   NVAL(SUM( CASE WHEN D.CAPITOL IN (1133) AND D.RIND IN ('080') THEN D.COL1 ELSE NULL END)) ||'<>'||
   NVAL(SUM( CASE WHEN D.CAPITOL IN (1132) AND D.RIND IN ('210') THEN D.COL2 ELSE NULL END))
    AS REZULTAT
FROM
  CIS2.VW_DATA_ALL_FR D            
  WHERE 
  (D.PERIOADA=:PERIOADA         OR :PERIOADA = -1) AND
  (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               OR :FORM = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  D.FORM IN (66) 
  
  HAVING
  
  NVAL(SUM( CASE WHEN D.CAPITOL IN (1133) AND D.RIND IN ('080') THEN D.COL1 ELSE NULL END)) <> 
   NVAL(SUM( CASE WHEN D.CAPITOL IN (1132) AND D.RIND IN ('210') THEN D.COL2 ELSE NULL END))


