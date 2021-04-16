SELECT 
L.CUIIO CUIIO_1047,
L.CUIIO_VERS CUIIO_VERS_1047,
R.CUIIO CUIIO_1046,
R.CUIIO_VERS CUIIO_VERS_1046

FROM USER_BANCU.VW_KATALOG_EI_78_1047 L 
      LEFT JOIN USER_BANCU.VW_KATALOG_EI_78_2009 R ON L.CUIIO = R.CUIIO 
      
      
      AND 
                                                      L.CUATM = R.CUATM  
      
      WHERE 
      
      R.CUIIO IS     NULL 
      
      
      
      ORDER BY 
      L.CUIIO