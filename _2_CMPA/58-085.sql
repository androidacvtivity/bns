SELECT
DECODE(CC.NR_COLUMN, '1', 'COL1 ', '2', 'COL2 ', '3', 'COL3 ', '4', 'COL4 ', '5', 'COL5 ' , '6', 'COL6 ' , '7', 'COL7 ' , '8', 'COL8 ' , '9', 'COL9 ' , '10', 'COL10 ' , '11', 'COL11 ' , '12', 'COL12 '  , '13', 'COL13 ' , '14', 'COL14 ' , '15', 'COL15 ' , '16', 'COL16 ' , '17', 'COL17 ' , '18', 'COL18 ' , '19', 'COL19 ')||': '|| 
 'CAP. I Rind 011 = '|| NVAL(SUM(CASE WHEN D.CAPITOL IN (416)   AND D.RIND IN ('011') THEN DECODE(CC.NR_COLUMN,  '4', D.COL4,  '6', D.COL6 , '7', D.COL7 , '9', D.COL9 , '13', D.COL13 ,  '16', D.COL16 ) END)) ||' CAP II , Rind 011 COL1 =  '||
 NVAL(SUM(CASE WHEN D.CAPITOL IN (417)   AND D.RIND IN ('011') THEN DECODE(CC.NR_COLUMN, '1', D.COL1) END))
  AS REZULTAT

FROM
  VW_DATA_ALL_GC D,             
       (                                                                        
       SELECT '1' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '2' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '3' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '4' AS NR_COLUMN FROM DUAL UNION  
       -------------------------------------------
       SELECT '5' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '6' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '7' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '8' AS NR_COLUMN FROM DUAL UNION     
       ----------------------------------------
       SELECT '9' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '10' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '11' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '12' AS NR_COLUMN FROM DUAL UNION     
       -------------------------------------
       SELECT '13' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '14' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '15' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '16' AS NR_COLUMN FROM DUAL UNION     
       ------------------------------------
       
       SELECT '17' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '18' AS NR_COLUMN FROM DUAL UNION                                  
      
                                       
       SELECT '19' AS NR_COLUMN FROM DUAL           
                             
       ) CC  
WHERE
  (D.PERIOADA IN (:PERIOADA)         OR :PERIOADA = -1) AND
  (D.NR_GOSP=:NR_GOSP               OR :NR_GOSP = -1) AND
  (D.UNIT_CODE_VERS=:UNIT_CODE_VERS     OR :UNIT_CODE_VERS = -1) AND
  (D.FORM = :FORM               OR :FORM = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (:CAPITOL=:CAPITOL           OR  :CAPITOL<>:CAPITOL) AND
  (:CAPITOL_VERS = :CAPITOL_VERS OR  :CAPITOL_VERS <> :CAPITOL_VERS) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  ( (D.FORM IN (58)  AND  D.CAPITOL IN (417)   AND D.RIND IN ('011')) 
   OR  
  (D.FORM IN (58)  AND  D.CAPITOL IN (416)   AND D.RIND IN ('011')))
 
  
GROUP BY
  CC.NR_COLUMN
  
HAVING
NVAL(SUM(CASE WHEN D.CAPITOL IN (416)   AND D.RIND IN ('011') THEN DECODE(CC.NR_COLUMN,  '4', D.COL4,  '6', D.COL6 , '7', D.COL7 , '9', D.COL9 , '13', D.COL13 ,  '16', D.COL16 ) END)) > 0
   
AND 

NVAL(SUM(CASE WHEN D.CAPITOL IN (417)   AND D.RIND IN ('011') THEN D.COL1 ELSE NULL  END)) = 0 