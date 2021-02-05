SELECT 
    'Rind.'||D.RIND ||' '|| DECODE(CC.NR_COLUMN, '1', 'COL4 ', '2', 'COL5 ')--||'- valoarea rîndului trebuie sa fie pozitiv'  
    AS REZULTAT
FROM
  CIS2.VW_DATA_ALL_FR D,             
       (                                                                        
       SELECT '1' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '2' AS NR_COLUMN FROM DUAL                                  
       ) CC   
WHERE
  (D.PERIOADA=:PERIOADA         OR :PERIOADA = -1) AND
  (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               OR :FORM = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  D.FORM IN (66)  AND
  D.CAPITOL IN (1133) AND
  D.RIND NOT IN ('030','060','070','080')
  
GROUP BY
  CC.NR_COLUMN,D.RIND,DECODE(CC.NR_COLUMN, '1', D.COL1, '2', D.COL2)

HAVING
DECODE(CC.NR_COLUMN,  '1', D.COL1, '2', D.COL2)<0

ORDER BY D.RIND