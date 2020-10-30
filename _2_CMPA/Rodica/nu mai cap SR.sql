SELECT 

 D.UNIT_CODE
 
 FROM 


(

    
  
  
  ) D LEFT JOIN  (
  
  SELECT
         D.UNIT_CODE
         
        
FROM
  VW_DATA_ALL_GC  D
 
 
  
  
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  D.FORM IN (58)  
    
  AND D.CAPITOL IN (416,417,418)

 
  
  GROUP BY 
  
D.UNIT_CODE
  
  
  ) R ON  D.UNIT_CODE = R.UNIT_CODE
  
  
  
  WHERE 
  R.UNIT_CODE IS NULL 
  