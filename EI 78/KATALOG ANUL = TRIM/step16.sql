








            SELECT 
            CUIIO, 
            CUIIO_VERS
            
              FROM USER_BANCU.VW_KATALOG_EI_78_2009
              
              WHERE 
              
              CUIIO IN (
              
              
              SELECT 
R.CUIIO
FROM USER_BANCU.VW_KATALOG_EI_78_1047 L 
      RIGHT JOIN USER_BANCU.VW_KATALOG_EI_78_2009 R ON L.CUIIO = R.CUIIO 
      
      WHERE 
      
      L.CUIIO IS  NULL 
              )
              
              
              AND CUIIO_VERS  =  2009 