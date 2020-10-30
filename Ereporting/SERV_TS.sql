


            SELECT 
            
            DISTINCT D.CUIIO,
            DATA_REG  
            
            FROM USER_EREPORTING.DATA_ALL D
            
            WHERE 
            D.PERIOADA = :pPERIOADA 
            AND D.FORM  = :pFORM  
             
            
            ORDER BY 
            DATA_REG DESC
            