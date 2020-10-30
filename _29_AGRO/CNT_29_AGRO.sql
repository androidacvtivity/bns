SELECT 
       
              L.CUIIO
       
       FROM 

        (

             SELECT 
        
              DISTINCT CUIIO
              
              FROM CIS2.DATA_ALL
              
                WHERE 
                
                FORM  IN (45)
                
                AND PERIOADA IN (:pPERIOADA) ) L LEFT JOIN 
                
                (
        SELECT 
          CUIIO,
          CUIIO_VERS    
       FROM USER_BANCU.VW_KATALOG_29_AGRO
                
                ) R  ON L.CUIIO = R.CUIIO 
                
                
                WHERE 
                
                R.CUIIO IS NULL;