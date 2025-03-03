﻿SELECT
  D.CUIIO,
  'COL'|| CC.NR_COLUMN||' '||
  
  
  SUM(CASE WHEN D.RIND     IN '0000' THEN DECODE(CC.NR_COLUMN, '1', NVAL(D.COL1), '2', NVAL(D.COL2), '3', NVAL(D.COL3), '4', NVAL(D.COL4), '5', NVAL(D.COL5), '6', NVAL(D.COL6), '7', NVAL(D.COL7), '8', NVAL(D.COL8), '9', NVAL(D.COL9), '10', NVAL(D.COL10)) ELSE 0 END) ||' <> '||
  SUM(CASE WHEN D.RIND NOT IN '0000' THEN DECODE(CC.NR_COLUMN, '1', NVAL(D.COL1), '2', NVAL(D.COL2), '3', NVAL(D.COL3), '4', NVAL(D.COL4), '5', NVAL(D.COL5), '6', NVAL(D.COL6), '7', NVAL(D.COL7), '8', NVAL(D.COL8), '9', NVAL(D.COL9), '10', NVAL(D.COL10)) ELSE 0 END) 
  
  
  AS REZULTAT
  
FROM 
  VW_DATA_ALL D,            
       (                                                                        
       SELECT '1' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '2' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '3' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '4' AS NR_COLUMN FROM DUAL UNION
       SELECT '5' AS NR_COLUMN FROM DUAL UNION 
       SELECT '6' AS NR_COLUMN FROM DUAL UNION
       SELECT '7' AS NR_COLUMN FROM DUAL UNION
       SELECT '8' AS NR_COLUMN FROM DUAL UNION
       SELECT '9' AS NR_COLUMN FROM DUAL UNION
       SELECT '10' AS NR_COLUMN FROM DUAL 
       
       ) CC
  
WHERE
  (D.PERIOADA IN (:PERIOADA)) AND
  (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
   D.CAPITOL = 324 AND
   D.FORM = :FORM AND
   D.FORM = 8
  
GROUP BY
  D.CUIIO,
  CC.NR_COLUMN

HAVING
  SUM(CASE WHEN D.RIND     IN '0000' THEN DECODE(CC.NR_COLUMN, '1', NVAL(D.COL1), '2', NVAL(D.COL2), '3', NVAL(D.COL3), '4', NVAL(D.COL4), '5', NVAL(D.COL5), '6', NVAL(D.COL6), '7', NVAL(D.COL7), '8', NVAL(D.COL8), '9', NVAL(D.COL9), '10', NVAL(D.COL10)) ELSE 0 END)  <>
  SUM(CASE WHEN D.RIND NOT IN '0000' THEN DECODE(CC.NR_COLUMN, '1', NVAL(D.COL1), '2', NVAL(D.COL2), '3', NVAL(D.COL3), '4', NVAL(D.COL4), '5', NVAL(D.COL5), '6', NVAL(D.COL6), '7', NVAL(D.COL7), '8', NVAL(D.COL8), '9', NVAL(D.COL9), '10', NVAL(D.COL10)) ELSE 0 END) 
  
  
ORDER BY
  CC.NR_COLUMN
  
