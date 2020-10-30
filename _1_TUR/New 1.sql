SELECT DISTINCT 

DECODE(CC.NR_COLUMN, '1', 'COL.1', '2', 'COL.2', '3', 'COL.3', '4', 'COL.4', '5', 'COL.5')||', Rind.'||D.RIND||': '||

  CIS2.nval(SUM(CASE WHEN D.PERIOADA= :PERIOADA   AND D.NUM IN (2,3,4) THEN  DECODE(CC.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5) ELSE 0 END))||' < '||

( CIS2.nval(SUM(CASE WHEN D.PERIOADA= :PERIOADA-1 AND D.NUM IN (1,2,3) THEN DECODE(CC.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5)ELSE 0 END))) 
 
  AS REZULTAT

FROM
  CIS2.VW_DATA_ALL D,             
       (                                                                        
       SELECT '1' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '2' AS NR_COLUMN FROM DUAL UNION 
       SELECT '3' AS NR_COLUMN FROM DUAL UNION 
       SELECT '4' AS NR_COLUMN FROM DUAL UNION 
       SELECT '5' AS NR_COLUMN FROM DUAL                                  
       ) CC                                      


WHERE
  (D.PERIOADA IN (:PERIOADA,:PERIOADA-1)) AND
  (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
  (:CUIIO_VERS=:CUIIO_VERS      OR :CUIIO_VERS <> :CUIIO_VERS) AND
  (D.FORM = :FORM               OR :FORM = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  D.FORM IN (6)  AND
  D.RIND NOT IN ('16') AND
  D.CAPITOL IN (315) 
  
 GROUP BY CC.NR_COLUMN,D.RIND
HAVING
 CIS2.nval(SUM(CASE WHEN D.PERIOADA= :PERIOADA  AND D.NUM IN (2,3,4) THEN  DECODE(CC.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5) ELSE 0 END)) < 

( CIS2.nval(SUM(CASE WHEN D.PERIOADA= :PERIOADA-1  AND D.NUM IN (1,2,3) THEN DECODE(CC.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5)ELSE 0 END)))