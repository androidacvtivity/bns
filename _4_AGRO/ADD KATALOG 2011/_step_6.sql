          
            SELECT 
             CUIIO,
              COUNT (CUIIO) AS CNT
            FROM AGRO_4
            
            
            GROUP BY 
            CUIIO
            
            HAVING 
            
           COUNT  (CUIIO)  > 1  