                INSERT INTO CIS2.SYS_USER_ACCES (
                
                 ID_USER,
                 CUATM,
                 FORM,
                 FORM_VERS,
                 ISADMIN,
                 ACCES_TYPE,
                 CAPITOL_ACCES,
                 DATA_REG  
                
                )



  SELECT 
                
                 L.ID_USER,
                 L.CUATM,
                 L.FORM,
                 L.FORM_VERS,
                 L.ISADMIN,
                 L.ACCES_TYPE,
                 L.CAPITOL_ACCES,
                 SYSDATE DATA_REG    


FROM 


(

                SELECT 
                
                 ID_USER,
                 CUATM,
                 66 FORM,
                 FORM_VERS,
                 ISADMIN,
                 ACCES_TYPE,
                 CAPITOL_ACCES,
                 SYSDATE DATA_REG    
                
                
                    FROM CIS2.SYS_USER_ACCES 
                    
                    WHERE 
                    
                    FORM = 57
                    
                    AND FORM_VERS = 2000
                   -- AND ID_USER NOT IN (734,693)
                    ) L LEFT JOIN (
                    
                    SELECT 
                
                 ID_USER,
                 CUATM,
                 FORM,
                 FORM_VERS,
                 ISADMIN,
                 ACCES_TYPE,
                 CAPITOL_ACCES,
                 SYSDATE DATA_REG    
                
                
                    FROM CIS2.SYS_USER_ACCES 
                    
                    WHERE 
                    
                    FORM = 66
                    
                    ) R ON R.ID_USER = L.ID_USER 
                    
                    
                    WHERE 
                    
                    R.ID_USER IS  NULL 
                    
                     AND ROWNUM < 20