

            SELECT 
               L.CUIIO,
               L.CUIIO_VERS,
               L.CAEM2   CAEM2
            FROM USER_BANCU.CAEM2 L LEFT JOIN  CIS2.RENIM R ON R.CUIIO = L.CUIIO 
                                                         AND  R.CUIIO_VERS = L.CUIIO_VERS
                                                         
                                                         WHERE 
                                                         R.CUIIO IS NOT NULL
                                                         
                                                         
                                                         ;  
            
            
            ;
            
            UPDATE  USER_BANCU.CAEM2
            SET CUIIO_VERS = 1053; 
            
            
              UPDATE  USER_BANCU.CAEM2
              
                  SET CAEM2 = TRIM(CAEM2); 