











                SELECT COUNT(*) AS CNT, 
                TRIM(DENUMIRE) DENUMIRE
                
                FROM CIS2.RENIM 
                
                WHERE 
                
                CUIIO_VERS = 2009 
                
                GROUP BY 
                DENUMIRE
                
                 