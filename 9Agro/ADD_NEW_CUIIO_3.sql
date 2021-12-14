SELECT 
        distinct CUIIO
        
            FROM data_all
            
            WHERE 
            
            perioada IN (2010)
            
            and form = 39
            
            AND cuiio IN (
            
            SELECT 
L.CUIIO


FROM USER_BANCU.KAT_9_AGRO L
            )