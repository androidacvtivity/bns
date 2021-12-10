 SELECT 
            L.CUIIO,
            L.CUIIO_VERS
            
               FROM  USER_BANCU.KAT_9_AGRO L
               
                    LEFT JOIN CIS2.RENIM R ON R.CUIIO = L.CUIIO AND R.CUIIO_VERS = L.CUIIO_VERS 
                    
                    WHERE
                    
                    R.CUIIO IS NOT NULL