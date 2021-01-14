            SELECT CUIIO,
            COUNT (CUIIO)  AS CNT

                    FROM USER_BANCU.INFFINAL C
                    
                    GROUP BY 
                    CUIIO
                    
                    HAVING 
                    COUNT (CUIIO) > 1;
                    
                    
                    SELECT *
                    FROM USER_BANCU.INFFINAL C
                    
                    WHERE 
                    
                    CUIIO_VERS = 2009