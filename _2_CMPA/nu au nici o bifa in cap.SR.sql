SELECT
       DISTINCT  D.UNIT_CODE 
       
       
FROM
  VW_DATA_ALL_GC  D
 
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  D.FORM IN (58)  AND
  D.CAPITOL NOT IN (419) 
  
  AND  D.UNIT_CODE NOT IN  (
  
  SELECT
       DISTINCT  D.UNIT_CODE 
       
       
FROM
  VW_DATA_ALL_GC  D
    
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   

  D.FORM IN (58)  AND
  D.CAPITOL  IN (419)
  AND D.RIND IN ('0')

  
  GROUP BY 
  D.UNIT_CODE
  
  
  
  
  )