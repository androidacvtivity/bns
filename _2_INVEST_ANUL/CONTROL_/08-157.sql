SELECT
  
  'COL'|| CC.NR_COLUMN||' '||
  SUM(CASE WHEN D.RIND IN '700' THEN DECODE(CC.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4) ELSE 0 END) ||' <> '||
  SUM(CASE WHEN D.RIND IN ('710','720') THEN DECODE(CC.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4) ELSE 0 END) AS REZULTAT
  
FROM 
  VW_DATA_ALL_TEMP D,            
       (                                                                        
       SELECT '1' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '2' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '3' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '4' AS NR_COLUMN FROM DUAL ) CC
  
WHERE
  (D.PERIOADA IN (:PERIOADA)) AND
  (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
   D.CAPITOL = 323 AND
   D.FORM = :FORM AND
   D.FORM = 8
  
GROUP BY
  CC.NR_COLUMN

HAVING
  SUM(CASE WHEN D.RIND IN '700' THEN DECODE(CC.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4) ELSE 0 END)  <> 
  SUM(CASE WHEN D.RIND IN ('710','720') THEN DECODE(CC.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4) ELSE 0 END)
  
ORDER BY
  CC.NR_COLUMN
  
