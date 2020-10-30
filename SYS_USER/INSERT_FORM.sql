--                INSERT INTO CIS2.SYS_USER_ACCES (
--                
--                 ID_USER,
--                 CUATM,
--                 FORM,
--                 FORM_VERS,
--                 ISADMIN,
--                 ACCES_TYPE,
--                 CAPITOL_ACCES,
--                 DATA_REG  
--                
--                )
--






                SELECT 
                
                1347 ID_USER,
                 CUATM,
                 FORM,
                 FORM_VERS,
                 ISADMIN,
                 ACCES_TYPE,
                 CAPITOL_ACCES,
                 SYSDATE DATA_REG    
                
                
                    FROM CIS2.SYS_USER_ACCES 
                    
                    WHERE 
                    
                    ID_USER IN (1156)