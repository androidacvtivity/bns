



SELECT 
 D.UNIT_CODE,
         D.CUATM,
         D.CAPITOL,
          D.RIND,
         SUM(D.COL1)  AS COL1,
         SUM(D.COL2) AS COL2,
         SUM(D.COL3) AS COL3,
         SUM(D.COL4) AS COL4,
         SUM(D.COL5) AS COL5,
         SUM(D.COL6) AS COL6,
         SUM(D.COL7) AS COL7,
         SUM(D.COL8) AS COL8,
         SUM(D.COL9) AS COL9,
         SUM(D.COL10) AS COL10,
         SUM(D.COL11) AS COL11,
         SUM(D.COL12) AS COL12,
         SUM(D.COL13) AS COL13

FROM
  VW_DATA_ALL_GC  D
  
  WHERE
  
   (D.PERIOADA IN (:pPERIOADA))  AND   
   (D.FORM = 62) 
   AND D.COL1 IS NOT NULL
 --  AND REGEXP_LIKE (D.COL1, '[[:alpha:]]')
 
-- AND REGEXP_LIKE(D.COL1, '[[:digit:]]')
 
 --AND REGEXP_LIKE(TO_CHAR(D.COL1), '[^0-9]+')
 
 
   GROUP BY 
    D.UNIT_CODE,
         D.CUATM,
         D.CAPITOL,
          D.RIND 
           
         ORDER BY
         D.UNIT_CODE,
         D.CUATM,
         D.RIND
         
         
       