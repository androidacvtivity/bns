 SELECT 
            CUIIO,
            COUNT(CUIIO) AS CNT
            
            FROM USER_BANCU.KAT_5_CON_1043_1
            
            GROUP BY 
            CUIIO
            
            HAVING 
            COUNT(CUIIO) = 1