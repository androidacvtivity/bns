




                         SELECT 
                                          A.CUIIO,
                                          A.CUIIO_VERS,
                                          A.DENUMIRE,
                                          A.CUATM,
                                          A.CAEM2,
                                          A.CFP,
                                          A.CFOJ
                                            
              FROM   USER_BANCU.KAT_1_INF_1 A LEFT JOIN CIS2.RENIM R ON R.CUIIO = A.CUIIO AND R.CUIIO_VERS = A.CUIIO_VERS 
              
              
             WHERE 
             
             R.CUIIO IS NULL 