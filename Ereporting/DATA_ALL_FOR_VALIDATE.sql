 SELECT 
            
            DISTINCT D.CUIIO,
            DATA_REG  
            
            FROM DATA_ALL_FOR_VALIDATE D
            
            WHERE 
            D.PERIOADA = :pPERIOADA 
            AND D.FORM  = :pFORM  
             
            
            ORDER BY 
            DATA_REG DESC