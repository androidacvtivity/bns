


            SELECT 
            A.CUIIO,
            A.CUIIO_VERS

         FROM USER_BANCU.KAT_1_TUR_ver2 A  
                                LEFT JOIN CIS2.RENIM B ON A.CUIIO = B.CUIIO AND 
                                                          A.CUIIO_VERS = B.CUIIO_VERS                                  
                                                          
                                                          
                                                          WHERE 
                                                          
                                                          B.CUIIO IS NOT NULL