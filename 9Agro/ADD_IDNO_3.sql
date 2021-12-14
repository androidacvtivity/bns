        SELECT 
            L.CUIIO,
            L.CUIIO_VERS,
            L.IDNO NEW_IDNO,
            R.IDNO
               FROM  USER_BANCU.KAT_9_AGRO L
                        LEFT JOIN CIS2.RENIM R ON R.CUIIO = L.CUIIO  
                        AND R.CUIIO_VERS = L.CUIIO_VERS 
                        
                        
                        WHERE 
                        1=1   
                           
                        AND 
                        
                        R.IDNO IS not    NULL
                        
                        
                        
                        ORDER BY
                        R.IDNO