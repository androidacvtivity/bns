                                    
                                    
                                    
                                    

                                INSERT INTO USER_BANCU.KAT_5_CON_1043_1  A
                                (
                                          A.CUIIO,
                                          A.CUIIO_VERS,
                                          A.DENUMIRE,
                                          A.CUATM,
                                          A.CAEM2,
                                          A.CFP,
                                          A.CFOJ
                                
                                )

                                    
                                    
                                    
                                    SELECT 
                                          A.CUIIO,
                                          A.CUIIO_VERS,
                                          A.DENUMIRE,
                                          A.CUATM,
                                          A.CAEM2,
                                          A.CFP,
                                          A.CFOJ
                              
                              
                              
                              FROM 
                              
                              (


-------------------------------------------------------------------------------------
                              -- 5
            
                              SELECT 
                                          A.CUIIO,
                                          A.CUIIO_VERS,
                                          A.DENUMIRE,
                                          A.CUATM,
                                          C.CODUL   CAEM2,
                                          A.CFP,
                                          A.CFOJ
                              
                              
                              
                              FROM 
                              
                              (

                            --4
                              SELECT 
                                          A.CUIIO,
                                          A.CUIIO_VERS,
                                          A.DENUMIRE,
                                          A.CUATM,
                                          A.CAEM2,
                                          A.CFP,
                                          A.CFOJ
                              
                              
                              
                              FROM 
                              
                              (
                              --3
                              SELECT 
                                          A.CUIIO,
                                          A.CUIIO_VERS,
                                          A.DENUMIRE,
                                          A.CUATM,
                                          CASE WHEN  LENGTH(A.CAEM2) = 5 THEN  SUBSTR(A.CAEM2,2) ELSE  A.CAEM2 END CAEM2, 
                                          A.CFP,
                                          A.CFOJ
                                          FROM
                              
                              (
                                --2    
                                  SELECT 
                                          A.CUIIO,
                                          A.CUIIO_VERS,
                                          A.DENUMIRE,
                                          A.CUATM,
                                          CASE WHEN  LENGTH(A.CAEM2) = 3 THEN '0'||A.CAEM2 ELSE  A.CAEM2 END CAEM2, 
                                          A.CFP,
                                          A.CFOJ
                                          
                         FROM(
                                 ---1
                                     SELECT      
                                          A.CUIIO,
                                          A.CUIIO_VERS,
                                          A.DENUMIRE,
                                          CASE WHEN LENGTH (A.CUATM) = 6  THEN '0'||A.CUATM ELSE  A.CUATM END  AS CUATM,
                                          A.CAEM2,
                                          A.CFP,
                                          A.CFOJ
                                     FROM USER_BANCU.KAT_5_CON_1043 A 
                                     
                                     ORDER BY 
                                      A.CUIIO
                                     
                                     --1
                                     
                                     ) A
                                       
                                        LEFT JOIN CIS2.VW_CL_CUATM C ON (C.CODUL = A.CUATM)
                                        
                                        WHERE 
                                        C.CODUL IS NOT NULL
                                        
                                        
                                        ORDER BY 
                                         A.CUIIO
                                        
                                           --2
                                        ) A
                                        
                                        
                                        
                                        WHERE 
                                        
                                        A.CAEM2 IS NOT NULL 
                                        
                                        ORDER BY 
                                         A.CUIIO
                                         
                                         --3
                                        
                                        
                                        ) A
                                        
                                        WHERE
                                        
                                        LENGTH(A.CAEM2) = 4
                                        
                                        ORDER BY 
                                        A.CUIIO
                                        
                                        --4
                                        
                                        ) A   LEFT JOIN CIS2.VW_CL_CAEM2 C ON (SUBSTR(C.CODUL,2) = A.CAEM2)
                                        
                                             LEFT JOIN CIS2.VW_CL_CFP     CF ON  A.CFP  = CF.CODUL  
                                             LEFT JOIN CIS2.VW_CL_CFOJ     CFOJ ON  A.CFOJ  = CFOJ.CODUL  
                                        
                                        WHERE 
                                        C.CODUL IS NOT NULL
                                        
                                      AND CF.CODUL IS NOT NULL
                                        
                                       AND CFOJ.CODUL IS NOT NULL
                                       
                                       
                                       ORDER BY 
                                       A.CUIIO
                                       --5
                                       
                                        
                                        ) A
                                        
                                        
                                        
                                        WHERE 
                                        
                                         A.CUATM IS   NOT NULL 
                                         
                                         OR   A.CAEM2 IS  NOT NULL 
                                         
                                         OR   A.CFP IS  NOT NULL 
                                         
                                         OR A.CFOJ IS  NOT NULL
                                         
                                         ORDER BY 
                                         A.CUIIO