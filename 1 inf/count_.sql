

       SELECT 
       
        COUNT (*) AS CNT
        
       FROM  USER_BANCU.ADD_KATALOG_1_TR_AUTO 
       
       
       
       UNION ALL 
       
       SELECT 
       
        COUNT (*) AS CNT
        
       FROM  USER_BANCU.ADD_KATALOG_1_TR_AUTO A
        
       
       WHERE 
       
        LENGTH(A.CAEM2) <> 5
        
        
        UNION ALL 
        
        SELECT 
       
        COUNT (*) AS CNT
        
       FROM  USER_BANCU.ADD_KATALOG_1_TR_AUTO A
        
       
       WHERE 
       
        LENGTH(A.CAEM2) = 5