


        SELECT *
        FROM USER_BANCU.VW_KATALOG_ASA_2009
        
        WHERE 
        
       -- CFP IN ('00','10','11','14','16')
        
        CFP IN (
          SELECT 
        
        DISTINCT GRUPA  
        

       FROM  CIS2.VW_CL_CFP
        )