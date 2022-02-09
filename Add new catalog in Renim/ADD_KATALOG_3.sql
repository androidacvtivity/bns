SELECT *

FROM USER_BANCU.KAT_EI_78_1052_V1;


--DELETE
--
--FROM USER_BANCU.KAT_EI_78_1052_V1;


--SELECT *
--
--FROM USER_BANCU.KAT_EI_78_1052;

;

--SELECT *
--
--FROM USER_BANCU.KAT_EI_78_1052;

--UPDATE USER_BANCU.KAT_EI_78_1052 
----SET CUATM = CASE WHEN (LENGTH(CUATM) = 6 AND (SUBSTR(CUATM,1,1) = 1  OR SUBSTR(CUATM,1,1) = 3 )) THEN '0'||CUATM ELSE CUATM END
--SET CAEM2 = CASE WHEN  LENGTH(CAEM2) =  5 THEN  SUBSTR(CAEM2,2,8)   ELSE  CAEM2  END;

--INSERT INTO  USER_BANCU.KAT_EI_78_1052_V1
--(
--   
--                    CUIIO,
--                    CUIIO_VERS,
--                    DENUMIRE,
--                    CUATM,
--                    CAEM2,
--                    CFP,
--                    IDNO
--                  
--)


               

                    
                  SELECT 
                  
                    A.CUIIO,
                    A.CUIIO_VERS,
                    A.DENUMIRE,
                    A.CUATM,
                    CA.CODUL  CAEM2,
                    A.CFP,
                    A.IDNO
                  
                    
                    FROM
                      

                 (   


                    SELECT 
                    
                        
                     D.CUIIO,
                     D.CUIIO_VERS,
                     D.DENUMIRE,
                   --  CASE WHEN (LENGTH(D.CUATM) = 6 AND (SUBSTR(D.CUATM,1,1) = 1  OR SUBSTR(D.CUATM,1,1) = 3 )) THEN '0'||D.CUATM ELSE CUATM END CUATM,
                     D.CUATM,
                     SUBSTR(D.CUATM,1,1)  CUATM_TEMP,
                     D.CFP,
                 --    SUBSTR(D.CAEM2,2,8) CAEM_MODF,
                     CASE WHEN  LENGTH(D.CAEM2) =  5 THEN  SUBSTR(D.CAEM2,2,8)   ELSE  D.CAEM2  END AS CAEM2,
                     D.IDNO
                     
                   --  D.CAEM2
                
                    
                    
                    
                        
                  FROM USER_BANCU.KAT_EI_78_1052  D
                  
                  
                            LEFT JOIN CIS2.VW_CL_CAEM2 C ON C.CODUL = D.CAEM2 
                            
                            
                            WHERE
                            1=1 
                           -- AND C.CODUL IS NULL



                   ) A  LEFT JOIN CIS2.VW_CL_CUATM C ON C.CODUL = A.CUATM
                   
                   
                       LEFT JOIN CIS2.VW_CL_CAEM2 CA ON CA.NUM_CODE = A.CAEM2    
                   
                   
                       LEFT JOIN CIS2.VW_CL_CFP CF ON CF.CODUL = A.CFP  
                      -- LEFT JOIN CIS2.VW_CL_CFOJ  CFJ ON CFJ.CODUL = A.CFOJ  
                        
                   
                   
                   WHERE 
                   
                    C.CODUL IS NOT NULL
                   
--                   AND 
--                   
                ---    CA.CODUL IS NOT    NULL
--                   
--                   AND 
--                   
               --    CF.CODUL IS NOT NULL
--
--                   
--                   
--                      AND 
--                  
--                   CFJ.CODUL IS  NOT  NULL 








                