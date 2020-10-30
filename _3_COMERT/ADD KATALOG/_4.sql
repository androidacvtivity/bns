


            DELETE 
            
            FROM USER_BANCU.KAT_3_COMERT_v1 
            
            WHERE ROWID NOT IN (

            SELECT 
            MIN(rowid)
               FROM USER_BANCU.KAT_3_COMERT_v1
               
               GROUP BY 
               CUIIO
               ) 