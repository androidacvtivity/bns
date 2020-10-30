--        INSERT INTO CIS2.SYS_USER_ACCES R
--         
--              (
--                 R.ID_USER,
--                 R.CUATM,
--                 R.FORM,      
--                 R.FORM_VERS,
--                 R.ISADMIN,
--                 R.ACCES_TYPE,
--                 R.CAPITOL_ACCES,
--                 R.DATA_REG
--                 )
--                 
                   
            SELECT 
            
                 R.ID_USER,
                 R.CUATM,
                 54    FORM,      
                 R.FORM_VERS,
                 R.ISADMIN,
                 R.ACCES_TYPE,
                 R.CAPITOL_ACCES,
                 R.DATA_REG   
            FROM
            (
            SELECT R.*
            
            FROM CIS2.SYS_USER_ACCES R
            
            
                WHERE 
                
                R.FORM = 53
                ) R
                
            
                    LEFT  JOIN  
                    
                    
                    (
                    SELECT R.*
            
            FROM CIS2.SYS_USER_ACCES R
            
            
                WHERE 
                
                R.FORM = 54
                    
                    ) A ON (R.ID_USER = A.ID_USER)   
            
            WHERE 
            1=1 
            
            AND A.ID_USER IS NULL
            
        
           -- AND ROWNUM <= 10