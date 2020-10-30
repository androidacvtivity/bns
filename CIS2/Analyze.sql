








                SELECT 
                
                    COUNT (*) AS CNT
                
                FROM CIS2.DATA_ALL 
                
                    
                
                UNION ALL 
                
                
                SELECT 
                
                    COUNT (*) AS CNT
                
                FROM CIS2.VW_DATA_ALL
                
                UNION ALL 
                
                SELECT 
                
                    COUNT (D.CUIIO) AS CNT
                
                FROM CIS2.DATA_ALL D  
                
                         INNER JOIN RENIM  R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 
                
                
                