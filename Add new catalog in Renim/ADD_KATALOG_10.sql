    
            SELECT 
             CUIIO,
              COUNT (CUIIO) AS CNT
            FROM USER_BANCU.KATALOG_2_INVEST_ANUL_READY
            
            
            GROUP BY 
            CUIIO
            
            HAVING 
            
           COUNT  (CUIIO)  =  1  