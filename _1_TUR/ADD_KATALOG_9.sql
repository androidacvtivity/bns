



            SELECT 
            CUIIO,
            COUNT(CUIIO) AS CNT
            
            FROM USER_BANCU.KAT_1_TR_AUTO_2
            
            GROUP BY 
            CUIIO
            
            HAVING 
            COUNT(CUIIO) >1