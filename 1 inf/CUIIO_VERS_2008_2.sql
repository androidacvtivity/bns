
                                                    SELECT 
                                          A.CUIIO,
                                          A.CUIIO_VERS,
                                          A.DENUMIRE,
                                          A.CUATM,
                                          CASE WHEN  LENGTH(A.CAEM2) = 3 THEN '0'||A.CAEM2 ELSE  A.CAEM2 END CAEM2, 
                                          A.CFP
                                          
                         FROM(

                SELECT 
                
                    A.CUIIO,
                    A.CUIIO_VERS,
                    A.DENUMIRE,
                    --A.CUATM,
                    CASE WHEN LENGTH (A.CUATM) = 6  THEN '0'||A.CUATM ELSE  A.CUATM END  AS CUATM,
                    A.CAEM2,
                    A.CFP,
                    A.CFOJ

                FROM USER_BANCU.KAT_1_INF A
                
                
                
                                        ) A
                                        
                                         LEFT JOIN CIS2.VW_CL_CUATM C ON (C.CODUL = A.CUATM)
                                        
                                        WHERE 
                                        C.CODUL IS NOT NULL