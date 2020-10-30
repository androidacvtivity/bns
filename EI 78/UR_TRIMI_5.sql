 

   -- Care au date in cap Export si Import  

   SELECT  
        
          DISTINCT CUIIO,
          CUIIO_VERS,
          RIND_VERS,
          MAX(DATA_REG) MAX_DATA_REG,
          MIN(DATA_REG) MIN_DATA_REG  
          
          FROM CIS2.VW_DATA_ALL 
          
          WHERE 
          
          PERIOADA IN (:pPERIOADA) 
          AND FORM IN (:pFORM)
          AND CAPITOL   IN (405,406,407,408)
          
          
          
          GROUP BY 
          CUIIO,
          CUIIO_VERS,
          RIND_VERS
          
          HAVING 
          
          RIND_VERS  = 1036
          
          
          
          
          
          
       