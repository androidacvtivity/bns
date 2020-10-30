






            
            SELECT 
             CUIIO,
              COUNT (CUIIO) AS CNT
            FROM USER_BANCU.KATALOG_EI_78
            
            
            GROUP BY 
            CUIIO
            
            HAVING 
            
           COUNT  (CUIIO)  > 1  
            