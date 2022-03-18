SELECT DISTINCT 
'r.10 = '||
SUM( CASE WHEN DECODE(N.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,
                                   '7', D.COL7, '8', D.COL8, '9', D.COL9, '10', D.COL10, '11', (CASE WHEN D.COL11 = 0 THEN  NULL ELSE D.COL11 END) , '12', D.COL12) IS NOT NULL AND D.RIND IN ('20') 
          THEN DECODE(N.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,
                                   '7', D.COL7, '8', D.COL8, '9', D.COL9, '10', D.COL10, '11', (CASE WHEN D.COL11 = 0 THEN  NULL ELSE D.COL11 END), '12', D.COL12)ELSE NULL END)
                                   
                                   ||', r.20 =  '||
SUM( CASE WHEN DECODE(N.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,
                                   '7', D.COL7, '8', D.COL8, '9', D.COL9, '10', D.COL10, '11', D.COL11, '12', D.COL12) IS NOT NULL AND D.RIND IN ('10') 
          THEN DECODE(N.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,
                                   '7', D.COL7, '8', D.COL8, '9', D.COL9, '10', D.COL10, '11', (CASE WHEN D.COL11 = 0 THEN  NULL ELSE D.COL11 END), '12', D.COL12) ELSE NULL END) 
                                   
                                   ||' , r.30 = '||
                                   
                                   SUM( CASE WHEN DECODE(N.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,
                                   '7', D.COL7, '8', D.COL8, '9', D.COL9, '10', D.COL10, '11', (CASE WHEN D.COL11 = 0 THEN  NULL ELSE D.COL11 END) , '12', D.COL12) IS NOT NULL AND D.RIND IN ('30') 
          THEN DECODE(N.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,
                                   '7', D.COL7, '8', D.COL8, '9', D.COL9, '10', D.COL10, '11', (CASE WHEN D.COL11 = 0 THEN  NULL ELSE D.COL11 END), '12', D.COL12)ELSE 0  END) ||' Col.'||N.NR_COLUMN
                                   
          AS REZULTAT
FROM VW_DATA_ALL D,
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
SELECT '10' AS NR_COLUMN FROM DUAL UNION
SELECT '11' AS NR_COLUMN FROM DUAL UNION
SELECT '12' AS NR_COLUMN FROM DUAL
) N
WHERE
  (D.PERIOADA=:PERIOADA         ) AND
  (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM=:FORM                 OR :FORM = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  D.RIND IN ('20','10','30')
GROUP BY N.NR_COLUMN,
D.COL11
HAVING

(
SUM( CASE WHEN DECODE(N.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,
                                   '7', D.COL7, '8', D.COL8, '9', D.COL9, '10', D.COL10, '11', D.COL11, '12', D.COL12) IS NOT NULL 
                                   
                                   AND D.RIND IN ('20') 
          THEN DECODE(N.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,
                                   '7', D.COL7, '8', D.COL8, '9', D.COL9, '10', D.COL10, '11', (CASE WHEN D.COL11 = 0 THEN  NULL ELSE D.COL11 END), '12', D.COL12) ELSE NULL END) 
                                   
                                   
                                   =  
SUM( CASE WHEN DECODE(N.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,
                                   '7', D.COL7, '8', D.COL8, '9', D.COL9, '10', D.COL10, '11', D.COL11, '12', D.COL12) IS NOT NULL AND D.RIND IN ('10') 
          THEN DECODE(N.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,
                                   '7', D.COL7, '8', D.COL8, '9', D.COL9, '10', D.COL10, '11', (CASE WHEN D.COL11 = 0 THEN  NULL ELSE D.COL11 END), '12', D.COL12) ELSE NULL  END)
                                   
 )
 
                                   
                                   
 
 
                                   
                                  
                                    
                                   
                                   
                                   
