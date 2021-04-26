SELECT 

   L.CUIIO TRIM_CUIIO,
   2010 CUIIO_VERS,
   L.CUATM  TRIM_CUATM,
   R.CUATM  ANUL_CUATM
  
   
   
  FROM USER_BANCU.VW_KATALOG_29_AGRO_1048 L 
  
                        LEFT JOIN USER_BANCU.VW_KATALOG_4_AGRO_2010 R ON L.CUIIO = R.CUIIO  AND 
                                                                         L.CUATM = R.CUATM 
                        
                        
                        WHERE 
                        R.CUIIO IS   NULL 