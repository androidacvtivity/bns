                                 SELECT 
                                          A.CUIIO,
                                          A.CUIIO_VERS,
                                          A.DENUMIREA,
                                          A.CUATM,
                                          A.CAEM2,
                                          A.CFP
                                          
                         FROM(
                        
                              SELECT      A.CUIIO,
                                          A.CUIIO_VERS,
                                          A.DENUMIREA,
                                          CASE WHEN LENGTH (A.CUATM) = 6  THEN '0'||A.CUATM ELSE  A.CUATM END  AS CUATM,
                                          A.CAEM2,
                                          A.CFP
                                     FROM USER_BANCU.VW_1_INF_2006 A ) A
                                     
                                        LEFT JOIN CIS2.VW_CL_CUATM C ON (C.CODUL = A.CUATM)
                                        
                                        WHERE 
                                        C.CODUL IS NOT NULL
                                        