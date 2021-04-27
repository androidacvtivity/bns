SELECT 
L.CUIIO CUIIO_1047,
L.CUIIO_VERS CUIIO_VERS_1047,
R.CUIIO CUIIO_1046,
R.CUIIO_VERS CUIIO_VERS_1046

FROM USER_BANCU.VW_KATALOG_EI_78_1047 L 
      LEFT JOIN USER_BANCU.VW_KATALOG_EI_78_2009 R ON (L.CUIIO = R.CUIIO  AND  L.CUATM = R.CUATM)  
      LEFT JOIN USER_BANCU.VW_KATALOG_EI_78_1046  R_46  ON (L.CUIIO = R_46.CUIIO  AND  L.CUATM = R_46.CUATM)  
      LEFT JOIN USER_BANCU.VW_KATALOG_EI_78_1045  R_45  ON (L.CUIIO = R_45.CUIIO  AND  L.CUATM = R_45.CUATM)  
      LEFT JOIN USER_BANCU.VW_KATALOG_EI_78_1045  R_44  ON (L.CUIIO = R_44.CUIIO  AND  L.CUATM = R_44.CUATM)  
                                                      
               ----------------                                       
                                                      
                                                      
                                                      
      
      WHERE 
      
      R.CUIIO IS      NULL 
      OR 
      R_46.CUIIO IS      NULL 
       OR 
      R_45.CUIIO IS      NULL 
      
      OR 
      R_44.CUIIO IS      NULL 
      
      
      
      ORDER BY 
      L.CUIIO