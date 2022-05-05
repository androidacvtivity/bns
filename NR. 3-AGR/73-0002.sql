SELECT DISTINCT
DECODE(CC.NR_COLUMN, '1', 'COL1 ', '2', 'COL2 ', '3', 'COL3 ', '4', 'COL4 ')||
' ['|| 

NVAL(SUM(CASE WHEN D.RIND IN('020') THEN 
DECODE(CC.NR_COLUMN, '1', D.COL4, '2', D.COL5, '3', D.COL6, '4', D.COL7)
ELSE 0 END))||' <> '||
NVAL(SUM(CASE WHEN D.RIND IN('05','08') THEN 
DECODE(CC.NR_COLUMN, '1', D.COL4, '2', D.COL5, '3', D.COL6, '4', D.COL7)
ELSE 0 END)) 



||']'AS REZULTAT
FROM
VW_DATA_ALL D,             
       (                                                                        
       SELECT '1' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '2' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '3' AS NR_COLUMN FROM DUAL UNION
       SELECT '4' AS NR_COLUMN FROM DUAL   
                        
       ) CC                                   
WHERE
  (D.PERIOADA=:PERIOADA          ) AND
  (D.CUIIO=:CUIIO                ) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               ) AND
  (D.FORM_VERS=:FORM_VERS ) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
 
 
  D.FORM = 73
  AND D.CAPITOL = 1196
  AND D.RIND IN ('020','030','040','050')
 
 

  GROUP BY CC.NR_COLUMN
  
HAVING
NVAL(SUM(CASE WHEN D.RIND IN('020') THEN 
DECODE(CC.NR_COLUMN, '1', D.COL4, '2', D.COL5, '3', D.COL6, '4', D.COL7)
ELSE 0 END))  <> 
NVAL(SUM(CASE WHEN D.RIND IN('05','08') THEN 
DECODE(CC.NR_COLUMN, '1', D.COL4, '2', D.COL5, '3', D.COL6, '4', D.COL7)
ELSE 0 END)) 