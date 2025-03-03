SELECT

 CIS2.NVAL(MAX( CASE WHEN D.RIND IN ('320')  THEN CIS2.NVAL(D.COL1)  ELSE 0 END)) ||' < '||  
(
 CIS2.NVAL(MAX( CASE WHEN D.RIND IN ('330')  THEN CIS2.NVAL(D.COL1)  ELSE 0 END)) +
 CIS2.NVAL(MAX( CASE WHEN D.RIND IN ('340')  THEN CIS2.NVAL(D.COL1)  ELSE 0 END)) +
 CIS2.NVAL(MAX( CASE WHEN D.RIND IN ('350')  THEN CIS2.NVAL(D.COL1)  ELSE 0 END)) 
 )
  
  AS REZULTAT

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
  
  D.CAPITOL IN (1126)
  
  HAVING  
  
 CIS2.NVAL(MAX( CASE WHEN D.RIND IN ('320')  THEN CIS2.NVAL(D.COL1)  ELSE 0 END)) <
(
 CIS2.NVAL(MAX( CASE WHEN D.RIND IN ('330')  THEN CIS2.NVAL(D.COL1)  ELSE 0 END))+
 CIS2.NVAL(MAX( CASE WHEN D.RIND IN ('340')  THEN CIS2.NVAL(D.COL1)  ELSE 0 END))+
 CIS2.NVAL(MAX( CASE WHEN D.RIND IN ('350')  THEN CIS2.NVAL(D.COL1)  ELSE 0 END))
 )
  