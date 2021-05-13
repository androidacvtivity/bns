SELECT 
 D.UNIT_CODE,
         D.CUATM,
         D.CAPITOL,
          D.RIND,
          D.COL1  AS COL1


FROM
  CIS2.VW_DATA_ALL_GC  D
  
  WHERE
  
   (D.PERIOADA IN (:pPERIOADA))  AND   
   (D.FORM = 62) 
  

 
 
   GROUP BY 
    D.UNIT_CODE,
         D.CUATM,
         D.CAPITOL,
          D.RIND
         
         
        ORDER BY 
        D.COL1