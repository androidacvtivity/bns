







            SELECT *


            from --USER_BANCU.VW_MAX_RENIM_CIS2
                   RENIM     
            
            
            WHERE 
            
            CUIIO IN (
              SELECT 
        
                CUIIO
        
        
                FROM USER_BANCU.KATALOG_V1
            
            )
            
            AND CUIIO_VERS = 2007
            
            
            ;