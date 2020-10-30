


  SELECT L.CUIIO 

        FROM USER_BANCU.VW_KATALOG_21_BSC_1035  L;  

--------------------------------------------------------------------------------

        SELECT L.CUIIO 

        FROM USER_BANCU.VW_KATALOG_21_BSC_1035  L  
        
                            LEFT JOIN USER_BANCU.VW_KATALOG_21_ASC_2005 R ON (R.CUIIO = L.CUIIO) 
        
        
        WHERE 
        R.CUIIO IS NOT NULL 
        
        
        ;
        
        
        
        