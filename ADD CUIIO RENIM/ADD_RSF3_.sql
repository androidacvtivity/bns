--INSERT INTO  USER_BANCU.KAT_4_RSF1_2
--(
--   
--                    CUIIO,
--                    CUIIO_VERS,
--                    DENUMIRE,
--                    CUATM,
--                    CAEM2,
--                    CFP,
--                    CFOJ,
--                    IDNO
--)


               

                    
                  SELECT 
                  
                    A.CUIIO,
                    A.CUIIO_VERS,
                    A.DENUMIRE,
                    A.CUATM,
                    --A.CAEM2
                    CA.CODUL  CAEM2,
                    
                    A.CFP,
                    A.CFOJ,
                    A.IDNO
                    
                    FROM
                      

                 (   


                    SELECT 
                    
                        
                     D.CUIIO,
                     2009 CUIIO_VERS,
                     D.DENUMIRE,
                     CASE WHEN (LENGTH(D.CUATM) = 6 AND (SUBSTR(D.CUATM,1,1) = 1  OR SUBSTR(D.CUATM,1,1) = 3 )) THEN '0'||D.CUATM ELSE CUATM END CUATM,
                     
                     SUBSTR(D.CUATM,1,1)  CUATM_TEMP,
                     D.CFP,
                 --    SUBSTR(D.CAEM2,2,8) CAEM_MODF,
                     CASE WHEN  LENGTH(D.CAEM2) =  5 THEN  SUBSTR(D.CAEM2,2,8)   ELSE  D.CAEM2  END AS CAEM2,
                     D.CFOJ,
                     D.IDNO
                    
                    
                    
                        
                  FROM USER_BANCU.KAT_4_RSF1 D
                  
                  
                            LEFT JOIN CIS2.VW_CL_CAEM2 C ON C.CODUL = TRIM(D.CAEM2) 
                            
                            
                            WHERE
                            1=1 
                           -- AND C.CODUL IS NULL



                   ) A  LEFT JOIN CIS2.VW_CL_CUATM C ON C.CODUL = A.CUATM
                   
                   
                       LEFT JOIN CIS2.VW_CL_CAEM2 CA ON CA.NUM_CODE = A.CAEM2    
                   
                   
                       LEFT JOIN CIS2.VW_CL_CFP CF ON CF.CODUL = TRIM(A.CFP)  
                        
                       
                       LEFT JOIN CIS2.VW_CL_CFOJ CFOJ  ON CFOJ.CODUL = TRIM(A.CFOJ)
                   
                   
                   WHERE 
                   
                  C.CODUL IS NOT   NULL
                   
--                   AND 
--                   
--                   CA.CODUL IS NOT   NULL
--                   
--                   AND 
--                   
--                   CF.CODUL IS NOT  NULL
--
--                    
--                   AND 
--                   
--                   CFOJ.CODUL IS NOT   NULL








                