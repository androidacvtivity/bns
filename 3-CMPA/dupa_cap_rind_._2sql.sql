SELECT 
 D.UNIT_CODE,
         D.CUATM,
         D.CAPITOL,
          D.RIND,
          D.COL1  AS COL1


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
          D.RIND ,
          D.COL1  
         
         
        ORDER BY 
        D.COL1