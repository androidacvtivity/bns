











            SELECT *

            FROM USER_BANCU.VW_MAX_RENIM_CIS2
            
            
            WHERE 
            
            CUIIO IN (
            
           

             SELECT 
             
             CUIIO
              
             FROM  USER_BANCU.VW_KATALOG_1_COMERT_2018
            
            )
            
            
            
            AND CUIIO_VERS  <>   2008