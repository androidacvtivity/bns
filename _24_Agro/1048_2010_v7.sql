



SELECT CUIIO



    FROM USER_BANCU.VW_KATALOG_RSF_2009
    
        WHERE 
        
        CUIIO IN (
        
        SELECT 

   L.CUIIO TRIM_CUIIO
--   L.CUATM TRIM_CUATM,
--   R.CUIIO YEAR_CUIIO,       
--   R.CUATM YEAR_CUATM
--   
   
  FROM USER_BANCU.VW_KATALOG_29_AGRO_1048 L 
  
                        LEFT JOIN USER_BANCU.VW_KATALOG_4_AGRO_2010 R ON L.CUIIO = R.CUIIO  AND 
                                                                         L.CUATM = R.CUATM 
                        
                        
                        WHERE 
                        R.CUIIO IS NOT   NULL 
        
        )

