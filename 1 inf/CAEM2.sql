                              
                              CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_1_INF_2006
(
   CUIIO,
   CUIIO_VERS,
   DENUMIREA,
   CUATM,
   CAEM2,
   CFP
)
AS


                                 SELECT 
                                          A.CUIIO,
                                          A.CUIIO_VERS,
                                          A.DENUMIREA,
                                          A.CUATM,
                                          A.CAEM2,
                                          A.CFP
                              
                              
                              
                              FROM 
                              
                              (


-------------------------------------------------------------------------------------

            
                              SELECT 
                                          A.CUIIO,
                                          A.CUIIO_VERS,
                                          A.DENUMIREA,
                                          A.CUATM,
                                          C.CODUL   CAEM2,
                                          A.CFP
                              
                              
                              
                              FROM 
                              
                              (


                              SELECT 
                                          A.CUIIO,
                                          A.CUIIO_VERS,
                                          A.DENUMIREA,
                                          A.CUATM,
                                          A.CAEM2,
                                          A.CFP
                              
                              
                              
                              FROM 
                              
                              (
                              SELECT 
                                          A.CUIIO,
                                          A.CUIIO_VERS,
                                          A.DENUMIREA,
                                          A.CUATM,
                                          CASE WHEN  LENGTH(A.CAEM2) = 5 THEN  SUBSTR(A.CAEM2,2) ELSE  A.CAEM2 END CAEM2, 
                                          A.CFP
                                          FROM
                              
                              (

                                  SELECT 
                                          A.CUIIO,
                                          A.CUIIO_VERS,
                                          A.DENUMIREA,
                                          A.CUATM,
                                          CASE WHEN  LENGTH(A.CAEM2) = 3 THEN '0'||A.CAEM2 ELSE  A.CAEM2 END CAEM2, 
                                          A.CFP
                                          
                         FROM(
                        
                              SELECT      A.CUIIO,
                                          A.CUIIO_VERS,
                                          A.DENUMIREA,
                                          CASE WHEN LENGTH (A.CUATM) = 6  THEN '0'||A.CUATM ELSE  A.CUATM END  AS CUATM,
                                          A.CAEM2,
                                          A.CFP
                                     FROM USER_BANCU.ADD_KATALOG_1_TR_AUTO A ) A
                                       
                                        LEFT JOIN CIS2.VW_CL_CUATM C ON (C.CODUL = A.CUATM)
                                        
                                        WHERE 
                                        C.CODUL IS NOT NULL
                                        ) A
                                        
                                        
                                        
                                        WHERE 
                                        
                                        A.CAEM2 IS NOT NULL 
                                        
                                        ) A
                                        
                                        WHERE
                                        
                                        LENGTH(A.CAEM2) = 4
                                        
                                        ) A   LEFT JOIN CIS2.VW_CL_CAEM2 C ON (SUBSTR(C.CODUL,2) = A.CAEM2)
                                        
                                              LEFT JOIN CIS2.VW_CL_CFP   CF ON  A.CFP  = CF.CODUL  
                                        
                                        WHERE 
                                        C.CODUL IS NOT NULL
                                        
                                        AND CF.CODUL IS NOT NULL
                                        
                                        ) A