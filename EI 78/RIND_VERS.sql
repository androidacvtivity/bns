









    SELECT 
    
      DISTINCT  CUIIO,
                RIND_VERS,
                MAX(DATA_REG)  DATA_REG  
      
      FROM CIS2.VW_DATA_ALL 
      
      WHERE

            FORM IN (44)
    
            AND PERIOADA IN (:pPERIOADA)
            AND CAPITOL IN (406)
            
           AND CUIIO IN (37524318) 
           
           
           GROUP BY 
           CUIIO,
           RIND_VERS
           
           
           
            HAVING 
            1=1 
           
            --AND RIND_VERS <>  1036 
            
            
    
    --AND CUIIO IN (37524318)
    
   -- AND RIND_VERS IN (1038)
   
 