SELECT
  NVAL(SUM(DISTINCT CASE WHEN DD.NUM NOT IN 1 AND DD.PERIOADA=:PERIOADA  THEN DD.COL1 /*31,6  */ELSE 0 END)) ||' <> '||
  NVAL(SUM(DISTINCT CASE WHEN DD.NUM NOT IN 1 AND DD.PERIOADA=:PERIOADA  THEN NVAL(DD.COL3)/*0,0 */ ELSE 0 END +
       CASE WHEN D.NUM NOT IN 12 AND D.PERIOADA=:PERIOADA - 1  THEN  NVAL(D.COL1) /* 9.4 */  ELSE 0 END)) AS REZULTAT
  
FROM

  CIS2.VW_DATA_ALL D
  INNER JOIN USER_EREPORTING.VW_DATA_ALL_FOR_VALIDATE DD ON (D.CUIIO=DD.CUIIO AND DD.ID_SCHEMA IN (2) AND D.FORM=DD.FORM AND D.RIND=DD.RIND AND D.CAPITOL=DD.CAPITOL)


  
  
  WHERE 
  (D.PERIOADA IN(:PERIOADA-1) AND
  DD.PERIOADA IN (:PERIOADA))AND
  (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
  (:CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               OR :FORM = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
    
  D.FORM IN (7)  AND
  D.CAPITOL IN (313)  
  AND D.RIND = '01'
  AND  DD.ID_SCHEMA IN (2)

  HAVING 
    
NVAL(SUM(DISTINCT CASE WHEN DD.NUM NOT IN 1 AND DD.PERIOADA=:PERIOADA  THEN DD.COL1 /*31,6  */ELSE 0 END))  <> 
  NVAL(SUM(DISTINCT CASE WHEN DD.NUM NOT IN 1 AND DD.PERIOADA=:PERIOADA  THEN NVAL(DD.COL3)/*0,0 */ ELSE 0 END +
       CASE WHEN D.NUM NOT IN 12 AND D.PERIOADA=:PERIOADA - 1  THEN  NVAL(D.COL1) /* 9.4 */  ELSE 0 END))