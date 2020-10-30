





        
         SELECT 
          CUIIO,
          COUNT(CUIIO) AS CNT   
          
         FROM KAT_3_COMERT_v1
         
         
         GROUP BY
         CUIIO 
         
         HAVING 
         COUNT(CUIIO) > 1
         
         