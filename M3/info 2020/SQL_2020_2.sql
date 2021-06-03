SELECT D.*
        
        
                FROM USER_BANCU.VW_KATALOG_M3_2009 D
                
                        INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
                        
                        
                        WHERE 
                        
                       
                        
                         (C.FULL_CODE LIKE '%' ||:pCOD_CUATM||';%') 
                
                